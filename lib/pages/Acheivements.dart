import 'package:flutter/material.dart';
import '../widget/Bottom_nav_bar.dart';

class acheivementPage extends StatefulWidget {
  const acheivementPage({super.key});

  @override
  State<acheivementPage> createState() => _acheivementPageState();
}

class _acheivementPageState extends State<acheivementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is acheivement Page"),
      ),
       bottomNavigationBar: BottomNavBar(),
    );
  }
}