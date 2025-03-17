import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/bottom_nav_Provider.dart';
import '../pages/home_page.dart';
import '../pages/Acheivements.dart';
import '../pages/settings_page.dart';
import '../pages/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _pages = [
    const HomePage(),
    const acheivementPage(),
    const settingsPage(),
    const profilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: _pages[provider.selectedIndex], // Directly show the selected page
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.selectedIndex,
            onTap: (index) {
              context.read<BottomNavProvider>().updateIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.star_half_outlined), label: "Achievements"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        );
      },
    );
  }
}
