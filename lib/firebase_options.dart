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
///



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
    apiKey: 'AIzaSyCX5BEW0-x0Hjpx3C7cL1ZI1tiMoK0-E3I',
    appId: '1:77720903573:web:15fcb633a66c8819c3209c',
    messagingSenderId: '77720903573',
    projectId: 'gproject-22d21',
    authDomain: 'gproject-22d21.firebaseapp.com',
    storageBucket: 'gproject-22d21.appspot.com',
    measurementId: 'G-8NXZP6N1CG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB38cVYXyhKa3e_oaTKbHGavPoLvBL4Zxg',
    appId: '1:77720903573:android:b9a215098474adccc3209c',
    messagingSenderId: '77720903573',
    projectId: 'gproject-22d21',
    storageBucket: 'gproject-22d21.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVaW-nBoQoFDu90VuNuugan938jPCk14s',
    appId: '1:77720903573:ios:2a03307b100b2eeec3209c',
    messagingSenderId: '77720903573',
    projectId: 'gproject-22d21',
    storageBucket: 'gproject-22d21.appspot.com',
    iosClientId: '77720903573-75m753qp5ln66fkqjrgu6mfhujqfkrkm.apps.googleusercontent.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVaW-nBoQoFDu90VuNuugan938jPCk14s',
    appId: '1:77720903573:ios:2a03307b100b2eeec3209c',
    messagingSenderId: '77720903573',
    projectId: 'gproject-22d21',
    storageBucket: 'gproject-22d21.appspot.com',
    iosClientId: '77720903573-75m753qp5ln66fkqjrgu6mfhujqfkrkm.apps.googleusercontent.com',
    iosBundleId: 'com.example.project',
  );
}
