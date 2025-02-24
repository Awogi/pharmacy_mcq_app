import 'package:flutter/material.dart';
class PageNavigator with ChangeNotifier{
  late BuildContext _context;
  void SetContext(BuildContext context){
    _context=context;
  }
  void Navigate_next_Page(Widget page){
    Navigator.push(_context, MaterialPageRoute(builder: (context)=>page));
  }
  void Back_Navigation(){
    Navigator.pop(_context);
  }

}