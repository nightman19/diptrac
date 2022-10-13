import 'package:diptrac_user/data/location_dao.dart';
import 'package:diptrac_user/ui/widgets/google_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../data/models/diptrac_pages.dart';
import '../../data/user_dao.dart';
import '../../data/location_dao.dart';
import '../../ui/google_maps.dart';
import 'google_map_page.dart';

class MainPage extends StatefulWidget {
  static MaterialPage page(int getSelectedUserCard) {
    return MaterialPage(
      name: DiptracPages.mainPath,
      key: ValueKey(DiptracPages.mainPath),
      child: const MainPage(),
    );
  }
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  GoogleMapWidget _googleMapWidget = new GoogleMapWidget();

  @override
  Widget build(BuildContext context) {
    final userDao = Provider.of<UserDao>(context, listen: false);
    final locationDao = Provider.of<LocationDao>(context, listen: false);

    // GoogleMaps googleMaps;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 44.0,
        ),
        // leading: buildDrawer(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text('Diptrac User'),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                userDao.logout();
              },
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: MapPage(),
      // body: GoogleMapWidget(),
    );
  }
}
