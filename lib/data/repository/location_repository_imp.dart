import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:live_tracking/data/model/failure.dart';
import 'package:live_tracking/data/model/positions_model.dart';
import 'package:live_tracking/domain/repository/location_repository.dart';
import 'package:live_tracking/utils/utils_function.dart';

class LocationRepositoryImp extends LocationRepository {
  final DatabaseReference _locationRef =
      FirebaseDatabase.instance.ref('locations'); // Correct usage

  @override
  Future<Either<Failure, dynamic>> positionStram(Position position) async {
    try {
      String? user_id = await UtilsFunction.getDeviceinfo();
       await _locationRef.child(user_id ?? 'non').set({
        'position': position.toJson(),
      });
      return const Right('Succsess');
    } catch (e) {
      return Left(const ServerFailure('lost'));
    }
  }

  @override
  Either<Failure, List<PositionsModel>> getData() {
    List<PositionsModel> positonList = [];
    try {
      _locationRef.once().then((DatabaseEvent event) {
        final dataSnapshot = event.snapshot;
        if (dataSnapshot.exists) {
          final Map<String, dynamic> data =
              Map<String, dynamic>.from(dataSnapshot.value as Map);

          positonList = PositionsModel.toListOfModel(data);
          return Right(positonList);
        } else {
          return Left(ServerFailure(''));
        }
      });
    } catch (e) {
      return Left(ServerFailure('$e'));
    }
    return Left(const ServerFailure(''));
  }
}
