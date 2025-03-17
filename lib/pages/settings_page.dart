import 'package:flutter/material.dart';
import '../widget/Bottom_nav_bar.dart';
class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Settings Page"),
        
      ),
      bottomNavigationBar: BottomAppBar(),
      );
  }
}