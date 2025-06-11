import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy_mcq_app/pages/achivements.dart';
import 'package:pharmacy_mcq_app/pages/profile.dart';
import 'package:pharmacy_mcq_app/pages/settings_page.dart';
import 'package:pharmacy_mcq_app/widget/constant_color.dart';

class NavBar extends StatefulWidget {
  final String username;
  final String email;
  final String? imageUrl;

  const NavBar({
    super.key,
    required this.username,
    required this.email,
    this.imageUrl,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _pickedImage = File(picked.path);
      });

      // You could also upload the image to Firebase here if needed.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: themegreydarker,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: themegrey,
                    backgroundImage: _pickedImage != null
                        ? FileImage(_pickedImage!)
                        : widget.imageUrl != null
                            ? NetworkImage(widget.imageUrl!) as ImageProvider
                            : AssetImage('assets/images/default_profile_picture.jpeg'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Theme.of(context).textTheme.bodyLarge?.color ==
                                  themelight
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.email,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Ubuntu",
                          color: Theme.of(context).textTheme.bodyLarge?.color ==
                                  themelight
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ... rest of your ListTiles

          ListTile(
            leading: Icon(Icons.person, color: themeblue),
            title: Text("Profile",
            style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Ubuntu",
                          color: (Theme.of(context).textTheme.bodyLarge?.color) ==
                                    themelight
                                ? Colors.black
                                : Colors.white,
                        ),
            ),
            onTap: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(username:widget.username,email:widget.email,),
                      ),
                    );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: themeblue),
            title: Text("Settings",
            style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Ubuntu",
                          color: (Theme.of(context).textTheme.bodyLarge?.color) ==
                                    themelight
                                ? Colors.black
                                : Colors.white,
                        ),
            ),
            onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingPage(),
                      ),
                    );
            },
          ),
          ListTile(
            leading: Icon(Icons.emoji_events, color: themeblue),
            title: Text("Achievements",
            style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Ubuntu",
                          color: (Theme.of(context).textTheme.bodyLarge?.color) ==
                                    themelight
                                ? Colors.black
                                : Colors.white,
                        ),
            ),
            onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => acheivementPage(),
                      ),
                    );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color:themeblue),
            title: Text("Logout", style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Ubuntu",
                          color: (Theme.of(context).textTheme.bodyLarge?.color) ==
                                    themelight
                                ? Colors.black
                                : Colors.white,
                        ),),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
