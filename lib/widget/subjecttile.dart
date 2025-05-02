import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/widget/constant_color.dart';

class SubjectTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SubjectTile({required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.07,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: themeblue,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 3.0,
          ), // Padding inside the tile
          leading: Icon(
            Icons.book, // Leading icon
            color: Colors.white,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white, // Text color
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        ),
      ),
    );
  }
}
