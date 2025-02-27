import 'package:flutter/material.dart';

class PageNavigator with ChangeNotifier {
  late BuildContext _context;
  void setContext(BuildContext context) {
    _context = context;
  }

  void navigateNextPage(Widget page) {
    Navigator.push(_context, MaterialPageRoute(builder: (context) => page));
  }

  void backNavigation() {
    Navigator.pop(_context);
  }
}
