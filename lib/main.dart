import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/pages/home_page.dart';
import 'package:pharmacy_mcq_app/pages/log_in.dart';
import 'package:pharmacy_mcq_app/widget/question_provider.dart';
import 'widget/color_theme_provider.dart';
import 'package:provider/provider.dart';
import 'widget/navigate_pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCbWy0dQhOZs9pZj-WUyjO9rNkjvgwX7f8",
        appId: "1:720700240813:web:1a871988350eb50bfae724",
        messagingSenderId: "720700240813",
        projectId: "quiz-app-5992c",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PageNavigator()),
        ChangeNotifierProvider(create: (context) => QuestionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          // home: const SplashScreen(child: WelcomePage()),
          home: AuthWrapper(),
        );
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Listen to authentication state changes
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If user is logged in
        if (snapshot.hasData) {
          final user = snapshot.data!;
          final uid = user.uid;
          final email = user.email ?? "No Email";

          return FutureBuilder<DocumentSnapshot>(
            future:
                FirebaseFirestore.instance.collection('users').doc(uid).get(),
            builder: (context, userSnapshot) {
              // Show loading spinner before checking auth state
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final username =
                  userSnapshot.data?.data() != null
                      ? (userSnapshot.data!.data()
                              as Map<String, dynamic>)['username'] ??
                          "User"
                      : "User";

              return HomePage(username: username, email: email);
            },
          );
        }

        // If user is not logged in, navigate to SignInPage
        return SignInPage();
      },
    );
  }
}
