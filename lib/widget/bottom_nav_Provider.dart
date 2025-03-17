import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier{
  int _SelectedIndex = 0;
  int get selectedIndex => _SelectedIndex;
  void updateIndex(int index){
    _SelectedIndex =index;
    notifyListeners();
  }
}