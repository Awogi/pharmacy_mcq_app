import 'dart:io';

import 'package:flutter/material.dart';

class FullScreenImageView extends StatelessWidget {
  final File? imageFile;
  final String? imageUrl;

  const FullScreenImageView({super.key, this.imageFile, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (imageFile != null) {
      imageProvider = FileImage(imageFile!);
    } else if (imageUrl != null) {
      imageProvider = NetworkImage(imageUrl!);
    } else {
      imageProvider = const AssetImage(
        'assets/images/default_profile_picture.jpeg',
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Full Image")),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(child: Image(image: imageProvider)),
      ),
    );
  }
}
