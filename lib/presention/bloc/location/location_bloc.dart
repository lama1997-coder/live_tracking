part of 'import.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final DatabaseReference _locationRef =
      FirebaseDatabase.instance.ref('locations'); // Correct usage
  final Location _traking;
  StreamSubscription<Position>? _positionSubscription;
  StreamSubscription<DatabaseEvent>? _locationSubscription;
// Store route points

  LocationBloc(this._traking) : super(LocationInitial()) {
    on<StartLocationTracking>(_onStartTracking);
    on<StartDataBaseTracking>(_startListening);
    on<LocationUpdated>(_onLocationUpdated);
    on<LocationDataBaseUpdated>(_onDataBaseUpdated);
  }

  Future<void> _onStartTracking(
      StartLocationTracking event, Emitter<LocationState> emit) async {
    try {
      // Request permission and start streaming location
      final permissionStatus = await Geolocator.requestPermission();
      if (permissionStatus == LocationPermission.whileInUse ||
          permissionStatus == LocationPermission.always) {
        _positionSubscription = Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 0, // Update every 10 meter
            //timeLimit: Duration(seconds: 1), // Set interval to 1 second
          ),
        ).listen((Position position) async {
          var user_id = await _traking.saveLocation(position);
        });
        await Future.delayed(Duration.zero);
        add(StartDataBaseTracking());

        //get the other postions
      } else {
        emit(const LocationLoadFailure('Location permission denied'));
      }
    } catch (e) {
      emit(LocationLoadFailure(e.toString()));
    }
  }

  void _startListening(
      StartDataBaseTracking event, Emitter<LocationState> emit) {
    // Listen to updates in Firebase Realtime Database
    try {
      _locationSubscription = _locationRef.onValue.listen((event) async {
        final dataSnapshot = event.snapshot;
        if (dataSnapshot.exists) {
          // Parse the data and emit new state
          final Map<String, dynamic> data =
              Map<String, dynamic>.from(dataSnapshot.value as Map);

          List<PositionsModel> positonList = PositionsModel.toListOfModel(data);
          log('---NEW DATA${data}');
          add(LocationDataBaseUpdated(positonList));
        }
      });
    } catch (e) {
      emit(LocationLoadFailure(e.toString()));
    }
  }

  Future<void> _onLocationUpdated(
      LocationUpdated event, Emitter<LocationState> emit) async {
    try {
      var user_id = await _traking.saveLocation(event.position);
    } catch (e) {
      emit(LocationLoadFailure('Failed to update location: $e'));
    }
  }

  Future<void> _onDataBaseUpdated(
      LocationDataBaseUpdated event, Emitter<LocationState> emit) async {
    try {
      emit(LocationLoadSuccess(event.position));
      // });
    } catch (e) {
      emit(LocationLoadFailure('Failed to update location: $e'));
    }
  }

  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    return super.close();
  }
}
