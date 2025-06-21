import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pharmacy_mcq_app/widget/images/fullImage.dart';

class ImageHandler {
  static File? pickedImage;
  static XFile? pickedFile;

  static final ImagePicker _picker = ImagePicker();

  ///  This method must be static and accept a Function(File)
  static Future<void> pickImage(Function(File image) onImagePicked) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      pickedFile = image;
      pickedImage = File(image.path);
      onImagePicked(pickedImage!); //  Call the passed callback
    }
  }

  static Future<void> uploadImage() async {
    if (pickedFile == null) {
      print("No image selected");
      return;
    }

    final path = 'files/${pickedFile!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);

    try {
      await ref.putFile(File(pickedFile!.path));
      print("Upload complete!");
    } catch (e) {
      print("Upload failed: $e");
    }
  }

  static Future<void> optionImage(
    BuildContext context,
    File? profileImage,
    String? imageUrl,
  ) async {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.image),
                title: Text('View Picture'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => FullScreenImageView(
                            imageFile: profileImage,
                            imageUrl: imageUrl,
                          ),
                    ),
                  );
                  // Implement view logic
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Select Profile Image'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage((image) {
                    // You can call setState from caller using a callback or manage this via state
                  });
                },
              ),
            ],
          ),
    );
  }
}
