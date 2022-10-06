import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({Key? key}) : super(key: key);

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController mapController;

  late Position currentPosition;
  var geolocator = Geolocator();

  bool circular = true;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14.0);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: _kGooglePlex,
          zoomControlsEnabled: false,
        ),
      ],
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  // Widget _buildLocateMeButton() {
  //   return InkWell(
  //     onTap: () {
  //       print('This is my current location.');
  //     },
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Container(
  //             alignment: Alignment.bottomCenter,
  //             width: MediaQuery.of(context).size.width - 90.0,
  //             height: 60,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20.0),
  //               color: Colors.black,
  //             ),
  //             child: Center(
  //               child: circular
  //                   ? const CircularProgressIndicator()
  //                   : const Text(
  //                       'Locate Me',
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 20,
  //                       ),
  //                     ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
