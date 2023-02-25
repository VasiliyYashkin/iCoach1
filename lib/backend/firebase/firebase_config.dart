import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCg1qpOHJ3TZ_UEG32z5Y1KFTvvpDujn_A",
            authDomain: "icoach-4fe22.firebaseapp.com",
            projectId: "icoach-4fe22",
            storageBucket: "icoach-4fe22.appspot.com",
            messagingSenderId: "570377037757",
            appId: "1:570377037757:web:243ea10f0cbc8763fe14d4",
            measurementId: "G-Z9C9749777"));
  } else {
    await Firebase.initializeApp();
  }
}
