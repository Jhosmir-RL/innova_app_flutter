import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "TU_API_KEY",
    appId: "TU_APP_ID",
    messagingSenderId: "TU_MESSAGING_SENDER_ID",
    projectId: "TU_PROJECT_ID",
    storageBucket: "TU_STORAGE_BUCKET",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "TU_API_KEY",
    appId: "TU_APP_ID",
    messagingSenderId: "TU_MESSAGING_SENDER_ID",
    projectId: "TU_PROJECT_ID",
    storageBucket: "TU_STORAGE_BUCKET",
    iosClientId: "TU_IOS_CLIENT_ID",
    iosBundleId: "TU_IOS_BUNDLE_ID",
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "TU_API_KEY",
    appId: "TU_APP_ID",
    messagingSenderId: "TU_MESSAGING_SENDER_ID",
    projectId: "TU_PROJECT_ID",
    storageBucket: "TU_STORAGE_BUCKET",
    authDomain: "TU_AUTH_DOMAIN",
    measurementId: "TU_MEASUREMENT_ID",
  );

  static FirebaseOptions get currentPlatform {
    return android; // Cambia según la plataforma si lo necesitas
  }
}
