import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class DropOffLocation {
  dynamic lat;
  dynamic lng;
  String? userId;
  DocumentReference? reference;

  DropOffLocation({
    required this.lat,
    required this.lng,
    this.userId,
    this.reference,
  });

  //Transform PickUpLocation Model from JSON
  factory DropOffLocation.fromJson(Map<dynamic, dynamic> json) =>
      DropOffLocation(
          lat: json['lat'] as Double,
          lng: json['lng'] as Double,
          userId: json['userId'] as String?);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'lat': lat,
        'lng': lng,
        'userId': userId,
      };

  //SnapShot from cloud firestore
  factory DropOffLocation.fromSnapshot(DocumentSnapshot snapshot) {
    final dropOffLocation =
        DropOffLocation.fromJson(snapshot.data() as Map<String, dynamic>);
    dropOffLocation.reference = snapshot.reference;
    return dropOffLocation;
  }
}
