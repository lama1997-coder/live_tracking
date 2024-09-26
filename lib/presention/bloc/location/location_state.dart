// location_state.dart
import 'package:equatable/equatable.dart';
import 'package:live_tracking/data/model/positions_model.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoadSuccess extends LocationState {
  final List<PositionsModel> positionsList;
  const LocationLoadSuccess(this.positionsList);
  @override
  List<Object> get props => [positionsList];
}

class LocationLoadFailure extends LocationState {
  final String error;
  const LocationLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
