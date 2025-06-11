import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String email;
  const ProfilePage({super.key, required this.username , required this.email});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("This is profile Page")));
  }
}
