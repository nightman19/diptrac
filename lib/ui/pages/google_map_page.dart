import 'package:diptrac_user/data/models/models.dart';
import 'package:diptrac_user/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:diptrac_user/ui/widgets/google_map_widget.dart';
import '../colors.dart';
import '../diptrac_theme.dart';
import '../../data/diptrac_data.dart';
import '../utils/helper_widgets.dart';
import 'diptrac_driver/driver_map_page.dart';

class MapPage extends StatefulWidget {
  static MaterialPage page(){
    return MaterialPage(
      name:DiptracPages.mapPath,
      key: ValueKey(DiptracPages.mapPath),
      child: const MapPage(),
    );
  }
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool circular = false;
  String? userId;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    final locationDao = Provider.of<LocationDao>(context, listen: false);
    final userDao = Provider.of<UserDao>(context, listen: false);
    userId = userDao.userId();

    return Stack(
      children: [
        const GoogleMapWidget(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildLocateMeButton(),
            _getDriverAppButton(),
          ],
        )
      ],
    );
  }

  void getLocation(LocationDao locationDao) async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final dropOffLocation = DropOffLocation(
      lat: position.latitude,
      lng: position.longitude,
      userId: userId,
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

  Widget _getDriverAppButton() {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DriverMapPage(),
            ),
          );
          print('Driver Track Drop-off\'s');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              color: Colors.deepOrange,
              child: Center(
                child: circular
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Driver Map Page',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ));
  }

  Widget _buildLocateMeButton() {
    final locationDao = Provider.of<LocationDao>(context, listen: false);
    TextTheme _textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        getLocation(locationDao);
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
