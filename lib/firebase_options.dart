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
    apiKey: 'AIzaSyAYdYfowHfil2OnQAvD_1-YCt3n-hI_lZc',
    appId: '1:346511291008:web:328bb576c8525c1701ac65',
    messagingSenderId: '346511291008',
    projectId: 'e-commerce-ef026',
    authDomain: 'e-commerce-ef026.firebaseapp.com',
    databaseURL: 'https://e-commerce-ef026-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-ef026.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpcm1jXRkZAJCfsOe1TrRUVvw8mLppWwE',
    appId: '1:346511291008:android:d598610d0e3443a601ac65',
    messagingSenderId: '346511291008',
    projectId: 'e-commerce-ef026',
    databaseURL: 'https://e-commerce-ef026-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-ef026.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCStOusDN2MgU3ngjKJmw4eABRS6lhXK1k',
    appId: '1:346511291008:ios:ff177642058ecb7301ac65',
    messagingSenderId: '346511291008',
    projectId: 'e-commerce-ef026',
    databaseURL: 'https://e-commerce-ef026-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-ef026.appspot.com',
    iosClientId: '346511291008-kgli2jrr5hv4urb3bri3gstpu7vt8jj9.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCStOusDN2MgU3ngjKJmw4eABRS6lhXK1k',
    appId: '1:346511291008:ios:ff177642058ecb7301ac65',
    messagingSenderId: '346511291008',
    projectId: 'e-commerce-ef026',
    databaseURL: 'https://e-commerce-ef026-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-ef026.appspot.com',
    iosClientId: '346511291008-kgli2jrr5hv4urb3bri3gstpu7vt8jj9.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce3',
  );
}
