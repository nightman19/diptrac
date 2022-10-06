// import 'package:diptrac_user/data/location_model.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
//
// import '../../data/location_dao.dart';
// import '../../data/user_dao.dart';
//
// class GoogleMaps extends StatefulWidget {
//   const GoogleMaps({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleMaps> createState() => _GoogleMapsState();
// }
//
// class _GoogleMapsState extends State<GoogleMaps> {
//   late GoogleMapController mapController;
//
//   late Position currentPosition;
//   var geolocator = Geolocator();
//
//   void locatePosition() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.best);
//     currentPosition = position;
//
//     LatLng latLngPosition = LatLng(position.latitude, position.longitude);
//
//     CameraPosition cameraPosition =
//         CameraPosition(target: latLngPosition, zoom: 14.0);
//     mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//   }
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     final locationDao = Provider.of<LocationDao>(context, listen: false);
//     final userDao = Provider.of<UserDao>(context, listen: false);
//
//     return Scaffold(
//       body: GoogleMap(
//         myLocationEnabled: true,
//         initialCameraPosition: _kGooglePlex,
//         zoomControlsEnabled: false,
//         zoomGesturesEnabled: true,
//         onMapCreated: onMapCreated,
//       ),
//     );
//   }
//
//   void onMapCreated(GoogleMapController controller) {
//     setState(() {
//       mapController = controller;
//     });
//     locatePosition();
//   }
//
//   void getLocation(LocationDao locationDao) async {
//     final Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.best);
//     final pickUpLocation = PickUpLocation(
//       lat: position.latitude,
//       lng: position.longitude,
//     );
//     locationDao.savePickUpLocation(pickUpLocation);
//   }
// }
