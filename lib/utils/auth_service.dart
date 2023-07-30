import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'locator.dart';
import 'navigation_service.dart';

class AuthService extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();
  bool _isLoggedIn = false;
  late User? _loggedInUser;

  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: "113921656321-up6dgtpjmh3pm07t60tpboaue665mp0e.apps.googleusercontent.com"
  );

  bool get isLoggedIn => _isLoggedIn;

  User? get loggedInUser => _loggedInUser;

  Future<bool> loginOutWithGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      _isLoggedIn = false;
      _loggedInUser = null;
      notifyListeners();
      navigationService.navigateTo('/signin');
      return true;
    } catch (ex) {
      print("Error: $ex");
      _isLoggedIn = true;
      notifyListeners();
      return false;
    }
  }

  void setLoggedInUser(User user) {
    _loggedInUser = user;
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<User?> loginWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
    UserCredential authResult = await auth.signInWithCredential(credential);
    return authResult.user;
  }

  Future<bool> checkIfUserIsLoggedIn() async {
    print("Checking if user is logged in");
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    _isLoggedIn = user != null;
    _loggedInUser = user;
    notifyListeners();
    return _isLoggedIn;
  }
}
