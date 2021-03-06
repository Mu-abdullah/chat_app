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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAl76OHrkvji2dwV3kI2xt_LWcvhfLBu9Q',
    appId: '1:519039846736:web:a82dfe386bfd7b49fa0455',
    messagingSenderId: '519039846736',
    projectId: 'chat-app-dacd6',
    authDomain: 'chat-app-dacd6.firebaseapp.com',
    storageBucket: 'chat-app-dacd6.appspot.com',
    measurementId: 'G-RCKR6KQZ77',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCviOuLbzPSui-ZrXoYZrOwC5A8wHzXmvM',
    appId: '1:519039846736:android:6f2187a499f9cbaffa0455',
    messagingSenderId: '519039846736',
    projectId: 'chat-app-dacd6',
    storageBucket: 'chat-app-dacd6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAu3p_ON0OcDrdv6HZznIj-zQnumyE0duI',
    appId: '1:519039846736:ios:15610e4ec6fda019fa0455',
    messagingSenderId: '519039846736',
    projectId: 'chat-app-dacd6',
    storageBucket: 'chat-app-dacd6.appspot.com',
    iosClientId: '519039846736-hb0djrj3i8ls91rguapcf9pi2sb9eru3.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}
