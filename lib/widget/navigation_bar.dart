import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
    final String username;
  final String email;
  const NavBar({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(username,
             style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontFamily: "Ubuntu",
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ),
          ListTile(
            title: Text(email,
             style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontFamily: "Ubuntu",
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
            ),
          )
        ],
      ),
    );
  }
}