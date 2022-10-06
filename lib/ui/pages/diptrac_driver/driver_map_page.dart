import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:diptrac_user/ui/widgets/google_map_widget.dart';

import '../../../data/diptrac_data.dart';
import '../../colors.dart';
import '../../widgets/driver_google_map_widget.dart';

class DriverMapPage extends StatefulWidget {
  const DriverMapPage({Key? key}) : super(key: key);

  @override
  State<DriverMapPage> createState() => _DriverMapPage();
}

class _DriverMapPage extends State<DriverMapPage> {
  bool circular = false;

  var dropOffs = [];

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    final locationDao = Provider.of<LocationDao>(context, listen: false);
    final userDao = Provider.of<UserDao>(context, listen: false);

    return Stack(
      children: const [
        DriverGoogleMapWidget(),
      ],
    );
  }

  void getLocation(LocationDao locationDao) async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final dropOffLocation = DropOffLocation(
      lat: position.latitude,
      lng: position.longitude,
      // userId: userId,
    );
    locationDao.saveDropOffLocation(dropOffLocation);
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Widget _buildDropOffButton() {
    final locationDao = Provider.of<LocationDao>(context, listen: false);

    return InkWell(
      onTap: () {

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60.0,
            color: primaryColor,
            child: Center(
              child: circular
                  ? const CircularProgressIndicator()
                  : const Text(
                      'Drop-off',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
