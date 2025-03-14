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
    apiKey: 'AIzaSyDV7HwwJwWAhMLZ9CXaa8kh1jdLfzqDUOQ',
    appId: '1:268279654932:web:e30fc6ae12e3a8688a5501',
    messagingSenderId: '268279654932',
    projectId: 'vpnnextways',
    authDomain: 'vpnnextways.firebaseapp.com',
    storageBucket: 'vpnnextways.firebasestorage.app',
    measurementId: 'G-VPWGKYYJBC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpuWsQ1j1n_cmGU868Gq1185PrWmV7sFM',
    appId: '1:268279654932:android:1f0abdadba900fcc8a5501',
    messagingSenderId: '268279654932',
    projectId: 'vpnnextways',
    storageBucket: 'vpnnextways.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfxoaS9MVFXdl32EshRvZMF-pwOXtL9ck',
    appId: '1:268279654932:ios:eefd0d789533b77f8a5501',
    messagingSenderId: '268279654932',
    projectId: 'vpnnextways',
    storageBucket: 'vpnnextways.firebasestorage.app',
    iosBundleId: 'com.example.flutterVpn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfxoaS9MVFXdl32EshRvZMF-pwOXtL9ck',
    appId: '1:268279654932:ios:eefd0d789533b77f8a5501',
    messagingSenderId: '268279654932',
    projectId: 'vpnnextways',
    storageBucket: 'vpnnextways.firebasestorage.app',
    iosBundleId: 'com.example.flutterVpn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDV7HwwJwWAhMLZ9CXaa8kh1jdLfzqDUOQ',
    appId: '1:268279654932:web:96c234f6222710478a5501',
    messagingSenderId: '268279654932',
    projectId: 'vpnnextways',
    authDomain: 'vpnnextways.firebaseapp.com',
    storageBucket: 'vpnnextways.firebasestorage.app',
    measurementId: 'G-M5W6GGP817',
  );
}
