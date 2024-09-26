
part of 'import.dart';


class RealTimeLocationScreen extends StatefulWidget {
  const RealTimeLocationScreen({super.key});

  @override
  _RealTimeLocationScreenState createState() => _RealTimeLocationScreenState();
}

class _RealTimeLocationScreenState extends State<RealTimeLocationScreen> {
  GoogleMapController? _mapController;
  RealTimeLocationData realTimeLocationData = RealTimeLocationData();
                final initialPosint = const LatLng(0, 0);


  @override
  void initState() {
    super.initState();
    // Start tracking the user's location
    context.read<LocationBloc>().add(StartLocationTracking());
  }

  void _onMapCreated(
      GoogleMapController controller, List<PositionsModel> position) {
    _mapController = controller;
      realTimeLocationData.fitMarkersToMap(position,_mapController);
  }
   // Function to add/update the custom marker with text and dot


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Real-Time Location Sharing')),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LocationLoadSuccess) {
            // Update the camera position as the user moves
            if (_mapController != null) {
              realTimeLocationData.fitMarkersToMap(state.positionsList,_mapController);
            }
         
            return GoogleMap(
              onMapCreated: (GoogleMapController controller) =>
                  _onMapCreated(controller, state.positionsList),
              initialCameraPosition: CameraPosition(
                target: initialPosint,
                zoom: 15,
                tilt: 30.0, // Adds a slight tilt for better visualization
                bearing: 45.0, //
              ),
              markers: 
              state.positionsList.map((positionModel) {
                var position = positionModel.position;
                var point = LatLng(position!.latitude, position.longitude);
                return Marker(
                  markerId: MarkerId(position.toString()),
                  position: point,
                  
                );
              }).toSet(),
          
            );
          } else if (state is LocationLoadFailure) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
