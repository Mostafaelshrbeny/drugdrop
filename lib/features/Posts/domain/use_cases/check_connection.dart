import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

checkConnection() async {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      log('User is currently signed out!');
    } else {
      log('User is signed in!');
    }
  });
}
