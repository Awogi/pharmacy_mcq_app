import 'package:flutter/material.dart';
import '../widget/Bottom_nav_bar.dart';
class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is profile Page"),
      ),
      bottomNavigationBar: BottomAppBar(),
      );
  }
}