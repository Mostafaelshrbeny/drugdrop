// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCm4KYmNSg1bBWd9Ou81V14IhYaoDBvLPY',
    appId: '1:881335357758:web:ba8d9d30576e99f6cd5c6f',
    messagingSenderId: '881335357758',
    projectId: 'findit-d457d',
    authDomain: 'findit-d457d.firebaseapp.com',
    storageBucket: 'findit-d457d.appspot.com',
    measurementId: 'G-LB4ZV5QVMR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtaNPA5GLh761TntrMfJ9we3x9HuA6QTQ',
    appId: '1:881335357758:android:6ac29937947a1d8acd5c6f',
    messagingSenderId: '881335357758',
    projectId: 'findit-d457d',
    storageBucket: 'findit-d457d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBl-YSNb7XXWlMYhu7NY_3P0tJGVEPnhLc',
    appId: '1:881335357758:ios:6714bf75af1877edcd5c6f',
    messagingSenderId: '881335357758',
    projectId: 'findit-d457d',
    storageBucket: 'findit-d457d.appspot.com',
    iosBundleId: 'com.example.findit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBl-YSNb7XXWlMYhu7NY_3P0tJGVEPnhLc',
    appId: '1:881335357758:ios:6714bf75af1877edcd5c6f',
    messagingSenderId: '881335357758',
    projectId: 'findit-d457d',
    storageBucket: 'findit-d457d.appspot.com',
    iosBundleId: 'com.example.findit',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCm4KYmNSg1bBWd9Ou81V14IhYaoDBvLPY',
    appId: '1:881335357758:web:e84f18e65cc4ff9bcd5c6f',
    messagingSenderId: '881335357758',
    projectId: 'findit-d457d',
    authDomain: 'findit-d457d.firebaseapp.com',
    storageBucket: 'findit-d457d.appspot.com',
    measurementId: 'G-EBBT9LCZKL',
  );
}