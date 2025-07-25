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
    apiKey: 'AIzaSyCgoxS9KjfkKV5ikbHdqGbOw4G3FzVcoss',
    appId: '1:673060443599:web:7ebeae7f6be52b37c76eba',
    messagingSenderId: '673060443599',
    projectId: 'flutterauth-e969b',
    authDomain: 'flutterauth-e969b.firebaseapp.com',
    storageBucket: 'flutterauth-e969b.firebasestorage.app',
    measurementId: 'G-11FK5WBBJS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIvkbYjzueW6TgTCGPwqiXdoTB3WGEf-4',
    appId: '1:673060443599:android:c66ecaf252a02ee4c76eba',
    messagingSenderId: '673060443599',
    projectId: 'flutterauth-e969b',
    storageBucket: 'flutterauth-e969b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_RtohoXThO94iaZbjwXWLl5CgCBncHas',
    appId: '1:673060443599:ios:ddd420d41b8159ebc76eba',
    messagingSenderId: '673060443599',
    projectId: 'flutterauth-e969b',
    storageBucket: 'flutterauth-e969b.firebasestorage.app',
    iosBundleId: 'com.example.firebaseaut',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_RtohoXThO94iaZbjwXWLl5CgCBncHas',
    appId: '1:673060443599:ios:ddd420d41b8159ebc76eba',
    messagingSenderId: '673060443599',
    projectId: 'flutterauth-e969b',
    storageBucket: 'flutterauth-e969b.firebasestorage.app',
    iosBundleId: 'com.example.firebaseaut',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCgoxS9KjfkKV5ikbHdqGbOw4G3FzVcoss',
    appId: '1:673060443599:web:05dd0ea6535425a8c76eba',
    messagingSenderId: '673060443599',
    projectId: 'flutterauth-e969b',
    authDomain: 'flutterauth-e969b.firebaseapp.com',
    storageBucket: 'flutterauth-e969b.firebasestorage.app',
    measurementId: 'G-TZP51E4130',
  );
}
