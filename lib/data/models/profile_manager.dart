import 'package:flutter/material.dart';

import 'models.dart';

class ProfileManager extends ChangeNotifier{
  User get getUser => User(
    firstName: 'John',
    lastName: 'Doe',
    role: 'Deliveryman',
    profileImageUrl: 'assets/profile_pics/person_userId.jpg',
    points: 100,
    darkMode: _darkMode,
  );

  bool get darkMode => _darkMode;
  var _darkMode = false;

  set darkMode(bool darkMode){
    _darkMode = darkMode;
    notifyListeners();
  }
}