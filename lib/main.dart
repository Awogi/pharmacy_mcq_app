import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:pharmacy_mcq_app/widget/Authentication_provider.dart';
import '../pages/Welcome_page.dart';
import './screen/splash.dart';
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
        // ChangeNotifierProvider(create: (context)=>AuthProvider()),
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
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: themeProvider.lightTheme,
          darkTheme: themeProvider.darkTheme,
          home: const SplashScreen(
            child: WelcomePage(),
          ), // Use your SplashScreen or WelcomePage
        );
      },
    );
  }
}
