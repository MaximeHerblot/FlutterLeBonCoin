// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDwBuMxD1PWrlWE5NzO29-JFDmneUcTCqk',
    appId: '1:848914813672:web:fd1d82934aaaba6b86af5d',
    messagingSenderId: '848914813672',
    projectId: 'ipssi-flutter-le-bon-coin',
    authDomain: 'ipssi-flutter-le-bon-coin.firebaseapp.com',
    storageBucket: 'ipssi-flutter-le-bon-coin.appspot.com',
    measurementId: 'G-CPRYZ1TWET',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaIGgCPFWb9xJ1F3ioqjHruX-YDVumlaM',
    appId: '1:848914813672:android:3be237dc6e1454a286af5d',
    messagingSenderId: '848914813672',
    projectId: 'ipssi-flutter-le-bon-coin',
    storageBucket: 'ipssi-flutter-le-bon-coin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSfV8fAoO0yP-KTzM-Py7agOvBrgmXo30',
    appId: '1:848914813672:ios:9f400b13cceb389986af5d',
    messagingSenderId: '848914813672',
    projectId: 'ipssi-flutter-le-bon-coin',
    storageBucket: 'ipssi-flutter-le-bon-coin.appspot.com',
    iosClientId: '848914813672-b8vjl5kuho4hgmlgbr97dhb476l7kjvv.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterLeBonCoin',
  );
}
