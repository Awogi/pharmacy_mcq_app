import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/widget/constant_color.dart';
import 'package:pharmacy_mcq_app/widget/images/images.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String email;
  final String? imageUrl;

  const ProfilePage({
    super.key,
    required this.username,
    required this.email,
    required this.imageUrl,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;

  void _selectImage() {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  ImageHandler.pickImage((image) {
                    setState(() {
                      _profileImage = image;
                    });
                  });
                },
              ),
              if (_profileImage != null)
                ListTile(
                  leading: Icon(Icons.upload),
                  title: Text('Upload to Firebase'),
                  onTap: () {
                    Navigator.pop(context);
                    ImageHandler.uploadImage();
                  },
                ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap:
                      () => ImageHandler.optionImage(
                        context,
                        _profileImage,
                        widget.imageUrl,
                      ),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: themegrey,
                    backgroundImage:
                        _profileImage != null
                            ? FileImage(_profileImage!)
                            : widget.imageUrl != null
                            ? NetworkImage(widget.imageUrl!) as ImageProvider
                            : const AssetImage(
                              'assets/images/default_profile_picture.jpeg',
                            ),
                  ),
                ),
                Positioned(
                  bottom: -8,
                  right: -5,
                  child: IconButton(
                    onPressed: _selectImage,
                    icon: const Icon(
                      Icons.add_a_photo,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(widget.username, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
