import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mcq_app/pages/sign_up.dart';
import 'package:mcq_app/screen/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCbWy0dQhOZs9pZj-WUyjO9rNkjvgwX7f8",
            appId: "1:720700240813:web:1a871988350eb50bfae724",
            messagingSenderId: "720700240813",
            projectId: "quiz-app-5992c"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        child: SignupPage(),
      ),
    );
  }
}
