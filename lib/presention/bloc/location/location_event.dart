// location_event.dart
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:live_tracking/data/model/positions_model.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class StartLocationTracking extends LocationEvent {}
class StartDataBaseTracking extends LocationEvent {}

class LocationDataBaseUpdated extends LocationEvent {
  final List<PositionsModel> position;

  const LocationDataBaseUpdated(this.position);

  @override
  List<Object> get props => [position];
}
class LocationUpdated extends LocationEvent {
  final Position position;

  const LocationUpdated(this.position);

  @override
  List<Object> get props => [position];
}
