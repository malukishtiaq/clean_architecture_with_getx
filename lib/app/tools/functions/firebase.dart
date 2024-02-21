import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../../constants/keys/firebase.dart';

Future<void> firebaseInitializeApp() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: firebaseWebApiKey,
        appId: firebaseWebAppId,
        messagingSenderId: firebaseWebMessagingSenderId,
        projectId: firebaseWebProjectId,
        authDomain: firebaseWebAuthDomain,
        storageBucket: firebaseWebStorageBucket,
        measurementId: firebaseWebMeasurementId,
      ),
    );
  } else {
    if (Platform.isIOS) {
      await Firebase.initializeApp();
    } else {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: firebaseAndroidApiKey,
          appId: firebaseAndroidAppId,
          messagingSenderId: firebaseAndroidMessagingSenderId,
          projectId: firebaseAndroidProjectId,
        ),
      );
    }
  }
}
