import 'dart:async';

import 'package:flutter/material.dart';

class AppUserTypeCard {
  static const int deliveryMan = 0;
  static const int deliveryPoint = 1;
}

class AppStateManager extends ChangeNotifier {
  bool _initialiazed = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedUserCard = AppUserTypeCard.deliveryMan;

  bool get isInitialized => _initialiazed;

  bool get isLoggedIn => _loggedIn;

  bool get isOnboardingComplete => _onboardingComplete;

  int get getSelectedUserCard => _selectedUserCard;

  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _initialiazed = true;
      notifyListeners();
    });
  }

  void login(String username, String password){
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnboarding(){
    _onboardingComplete = true;
    notifyListeners();
  }
  void goToUserCard(index){
    _selectedUserCard = index;
    notifyListeners();
  }

  void logout(){
    _loggedIn = false;
    _onboardingComplete = false;
    _initialiazed = false;
    _selectedUserCard = 0;

    initializeApp();
    notifyListeners();
  }
}
