import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCHDj2qUAqjGN_OzxpjhfonOSGMSIy7jFI',
    appId: '1:906899649975:web:27d58c85be222f77d82432',
    messagingSenderId: '906899649975',
    projectId: 'ipenda',
    authDomain: 'ipenda.firebaseapp.com',
    databaseURL: 'https://ipenda.firebaseio.com',
    storageBucket: 'ipenda.appspot.com',
    measurementId: 'G-D2RV3ZF3YQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1T_8P7WRsua7c24_urGazY6N55iekmWQ',
    appId: '1:906899649975:android:7c8267852f57e274d82432',
    messagingSenderId: '906899649975',
    projectId: 'ipenda',
    databaseURL: 'https://ipenda.firebaseio.com',
    storageBucket: 'ipenda.appspot.com',
  );
}
