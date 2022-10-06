import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserDao extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  //Authentication Helper Methods

  //Check if user is loggedIn
  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  //Return the user id
  String? userId() {
    return auth.currentUser?.uid;
  }

  //Return the email address of user
  String? email() {
    return auth.currentUser?.email;
  }

  // Signing up user
  void signup(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //Logging in a user
  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password'){
        print('The password provided is too weak');
      }else if (e.code == 'email-already-in-use'){
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await auth.signOut();
    notifyListeners();
  }
}