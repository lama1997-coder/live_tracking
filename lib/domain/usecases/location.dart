import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:live_tracking/data/model/failure.dart';
import 'package:live_tracking/data/model/positions_model.dart';
import 'package:live_tracking/domain/repository/location_repository.dart';

class Location {
  final LocationRepository trackRepository;
  Location(this.trackRepository);
  Future<Either<Failure, dynamic>> saveLocation(Position position) {
    return trackRepository.positionStram(position);
  }
   Either<Failure, List<PositionsModel>> getPositions() {
    return trackRepository.getData();
  }
}
