import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBeISMiX_mz_bBpjlcPqVuQ0p89XvFfLTA",
            authDomain: "my-pet-ffdb0.firebaseapp.com",
            projectId: "my-pet-ffdb0",
            storageBucket: "my-pet-ffdb0.appspot.com",
            messagingSenderId: "170661556940",
            appId: "1:170661556940:web:17091bf137d3a7b9914869",
            measurementId: "G-L7S8HK3F6D"));
  } else {
    await Firebase.initializeApp();
  }
}
