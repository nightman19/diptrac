import 'package:diptrac_user/data/location_dao.dart';
import 'package:diptrac_user/data/user_dao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/models.dart';
import '../diptrac_theme.dart';
import '../navigation/app_router.dart';

class DiptracApp extends StatefulWidget {
  const DiptracApp({Key? key}) : super(key: key);

  @override
  State<DiptracApp> createState() => _DiptracAppState();
}

class _DiptracAppState extends State<DiptracApp> {
  final _appStateManager = AppStateManager();
  final _profileManager = ProfileManager();
  late AppRouter _appRouter;

  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      profileManager: _profileManager,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
        Provider<LocationDao>(
          lazy: false,
          create: (_) => LocationDao(),
        )
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = DiptracTheme.dark();
          } else {
            theme:
            DiptracTheme.light();
          }

          return MaterialApp(
            title: 'Diptrac',
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        },
      ),
    );
  }
}
