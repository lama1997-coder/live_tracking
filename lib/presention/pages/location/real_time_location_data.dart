part of 'import.dart';

class RealTimeLocationData {


  void fitMarkersToMap(List<PositionsModel> markerPositions,GoogleMapController? mapController) {
    if (markerPositions.isEmpty) return ;

    LatLngBounds bounds;
    if (markerPositions.length == 1) {
      Position position = markerPositions[0].position!;
      // If there's only one marker, zoom to that marker
      bounds = LatLngBounds(
        southwest: LatLng(position.latitude, position.longitude), // San Francisco
        northeast: LatLng(position.latitude, position.longitude), // San Francisco
      );
    } else {
      // Create bounds for multiple markers
      LatLng southwest = LatLng(
        markerPositions.map((m) => m.position!.latitude).reduce((a, b) => a < b ? a : b),
        markerPositions.map((m) => m.position!.longitude).reduce((a, b) => a < b ? a : b),
      );
      LatLng northeast = LatLng(
        markerPositions.map((m) => m.position!.latitude).reduce((a, b) => a > b ? a : b),
        markerPositions.map((m) => m.position!.longitude).reduce((a, b) => a > b ? a : b),
      );
      bounds = LatLngBounds(southwest: southwest, northeast: northeast);
    }

    // Animate the camera to fit the bounds
       mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 100)); // 50 for padding
  }


}