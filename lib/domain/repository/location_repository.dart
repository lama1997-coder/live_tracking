import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:live_tracking/data/model/failure.dart';
import 'package:live_tracking/data/model/positions_model.dart';

abstract class LocationRepository {
  //get postion stream to listion to location changes 
  Future<Either<Failure, dynamic>> positionStram(Position position);
  //listen to Real Time Database function
  Either<Failure, List<PositionsModel>> getData();
}
