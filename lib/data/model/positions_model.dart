import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionsModel {
  Position? position;
  List<LatLng>? routePoints;
  String? userId;

  PositionsModel(
      {required this.position,
      required this.routePoints,
      required this.userId});

  PositionsModel.fromJson(Map<String, dynamic> json) {
    position = PositionData.fromJson(
        Map<String, dynamic>.from(json['position'] ?? {}));
    routePoints = json['routePoints'] ?? [];
    userId = json['userId'];
  }

  static List<PositionsModel> toListOfModel(Map<String, dynamic> data) {
    return data.keys
        .map((key) => PositionsModel.fromJson({...data[key], 'userId': key}))
        .toList();
  }
}

class PositionData {
  double? accuracy;
  double? altitude;
  double? altitudeAccuracy;

  double? heading;
  double? headingAccuracy;
  bool? isMocked;
  double? latitude;
  double? longitude;
  double? speed;
  double? speedAccuracy;
  DateTime? timestamp;

  PositionData(
      {this.accuracy,
      this.altitude,
      this.altitudeAccuracy,

      this.heading,
      this.headingAccuracy,
      this.isMocked,
      this.latitude,
      this.longitude,
      this.speed,
      this.speedAccuracy,
      this.timestamp});

  static Position? fromJson(Map<String?, dynamic> json) {
    return Position(
        accuracy: json['accuracy'].toDouble(),
        altitude: json['altitude'].toDouble(),
        altitudeAccuracy: json['altitude_accuracy'].toDouble(),
        heading: json['heading'].toDouble(),
        headingAccuracy: json['heading_accuracy'].toDouble(),
        isMocked: json['is_mocked'],
        latitude: json['latitude'].toDouble(),
        longitude: json['longitude'].toDouble(),
        speed: json['speed'].toDouble(),
        speedAccuracy: json['speed_accuracy'].toDouble(),
        timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp']));

  }
}
