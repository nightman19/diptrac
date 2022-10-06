import 'package:diptrac_user/data/location_dao.dart';
import 'package:diptrac_user/data/location_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class DriverGoogleMapWidget extends StatefulWidget {
  const DriverGoogleMapWidget({Key? key}) : super(key: key);

  @override
  State<DriverGoogleMapWidget> createState() => _DriverGoogleMapWidgetState();
}

class _DriverGoogleMapWidgetState extends State<DriverGoogleMapWidget> {
  late GoogleMapController mapController;
  late BitmapDescriptor pinLocationIcon;
  late Position position;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    setState((){
      getMarkerData();
    });

    setCustomMapPin();
  }

  void getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition();
    setState(() {
      position = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dropOffLocationDao = Provider.of<LocationDao>(context, listen: false);

    return Stack(
      children: <Widget>[
        _buildDriverMap(context),
        // getMarkerData(),

      ]
    );
      
  }

  Set<Marker> getMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId('Drops'),
        position: LatLng(37.333113, -121.909557),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: 'Drops'),
      ),
    ].toSet();
  }

  getMarkerData() async {
    FirebaseFirestore.instance
        .collection('dropOffLocation')
        .get()
        .then((dropsData) {
      if (dropsData.docs.isNotEmpty) {
        for (int i = 0; i < dropsData.docs.length; i++) {
          initMarker(dropsData.docs[i].data(), dropsData.docs[i].id);
        }
      }
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  // populateClients() {
  //   FirebaseFirestore.instance.collection('dropOffLocation').get().then((docs) {
  //     if (dropOffLocation.docs.isNotEmpty) {
  //       for (int i = 0; i < docs.docs.length; i++) {
  //         initMarker(
  //           docs.docs[i].data(),
  //           docs.docs[i].id,
  //         );
  //       }
  //     }
  //   });
  // }
  // Widget _getDropsList(LocationDao dropOffLocationDao) {
  //   return Expanded(
  //     child: StreamBuilder<QuerySnapshot>(
  //       stream: dropOffLocationDao.getDropOffLocationStream(),
  //       builder: (context, snapshot) {
  //         if (!snapshot.hasData) {
  //           return const Center(
  //             child: LinearProgressIndicator(),
  //           );
  //         }
  //         return _buildList(context, snapshot.data!.docs);
  //       },
  //     ),
  //   );
  // }

  // Widget _buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
  //   return ListView(
  //     children:
  //         snapshot!.map((data) => _buildDriverMap(context, data)).toList(),
  //   );
  // }

  Widget _buildDriverMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.333113, -121.909557),
          zoom: 14.0,
        ),
        onMapCreated: onMapCreated,
        markers: Set<Marker>.of(markers.values),
        // polylines: Set<Polyline>.of(polylines.values),
      ),
    );
  }

  void initMarker(dropOffLocation, dropOffLocationId) async {
    var markerIdVal = dropOffLocationId;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        double.parse(dropOffLocation['lat'].double),
        double.parse(dropOffLocation['lng'].double),
      ),
      icon: pinLocationIcon,
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/icons/marker.png');
  }
}
