import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAjYCOvvTVjBpRlWwdB3OSBLpXmokCMwpc",
            authDomain: "playtime-manager.firebaseapp.com",
            projectId: "playtime-manager",
            storageBucket: "playtime-manager.firebasestorage.app",
            messagingSenderId: "1070955323554",
            appId: "1:1070955323554:web:9b502e75e404e16d0237fb"));
  } else {
    await Firebase.initializeApp();
  }
}
