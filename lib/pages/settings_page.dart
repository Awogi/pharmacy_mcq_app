import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/pages/changepassword.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("This is Settings Page")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChangePasswordPage()),
              );
            },
            child: Text("Change your Password"),
          ),
        ],
      ),
    );
  }
}
