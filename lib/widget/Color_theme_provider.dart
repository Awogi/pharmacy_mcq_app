import 'package:flutter/material.dart';
import '../widget/constant_color.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false; // Default to light mode

  bool get isDarkMode => _isDarkMode;

  // Toggle dark mode
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notify listeners when the theme changes
  }

  // Define light and dark theme colors here
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor:
          themeblue, // Light mode primary color // Light mode background color
      scaffoldBackgroundColor:
          themelight, // Light mode scaffold background color
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF01949a), // Light mode AppBar color
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black), // Light mode text color
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Color(
        0xFF01949a,
      ), // Dark mode primary color // Dark mode background color
      scaffoldBackgroundColor:
          Colors.black, // Dark mode scaffold background color
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF01949a), // Dark mode AppBar color
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white), // Dark mode text color
      ),
    );
  }

  // Get the current theme based on dark mode status
  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;
}
