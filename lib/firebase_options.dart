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
    apiKey: 'AIzaSyCSJooBp6YDBb-JVfCul_IRtSpP9Uuv5vo',
    appId: '1:152976764964:web:875a8edde4ecccde5fe8b1',
    messagingSenderId: '152976764964',
    projectId: 'iti-project-ce214',
    authDomain: 'iti-project-ce214.firebaseapp.com',
    storageBucket: 'iti-project-ce214.appspot.com',
    measurementId: 'G-3FP58FF3JL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCt-8gERPBMB7Z0Kaq3VMmWpEiQPn4BX80',
    appId: '1:152976764964:android:e3cd09541206a8295fe8b1',
    messagingSenderId: '152976764964',
    projectId: 'iti-project-ce214',
    storageBucket: 'iti-project-ce214.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA87t3wkNSLAM-xt-QsEI8lOcyh5rg5gHA',
    appId: '1:152976764964:ios:a334627ca40d5f6f5fe8b1',
    messagingSenderId: '152976764964',
    projectId: 'iti-project-ce214',
    storageBucket: 'iti-project-ce214.appspot.com',
    iosClientId: '152976764964-5vu3b4dsqce27a48qnk1iv1dkvhtlq6t.apps.googleusercontent.com',
    iosBundleId: 'com.example.itiProjects',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA87t3wkNSLAM-xt-QsEI8lOcyh5rg5gHA',
    appId: '1:152976764964:ios:6d55dba05087d0235fe8b1',
    messagingSenderId: '152976764964',
    projectId: 'iti-project-ce214',
    storageBucket: 'iti-project-ce214.appspot.com',
    iosClientId: '152976764964-oeoj4n15l23eu4c54o5v0mc5f6dshapj.apps.googleusercontent.com',
    iosBundleId: 'com.example.itiProjects.RunnerTests',
  );
}
