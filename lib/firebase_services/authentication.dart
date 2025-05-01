// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/pages/home_page.dart';
import 'package:pharmacy_mcq_app/pages/log_in.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp(
    BuildContext context,
    String email,
    String password,
    String username,
  ) async {
    final userEmail = email.trim().toLowerCase();
    final userPassword = password.trim();
    final userName = username.trim();

    if (userEmail.isEmpty || userPassword.isEmpty || userName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the fields.")),
      );
      return;
    }

    if (userName.length <= 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username must be more than 2 characters."),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: userEmail,
            password: userPassword,
          );

      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': userName,
          'email': userEmail,
          'role': 'user',
          'createdAt': FieldValue.serverTimestamp(),
        });

        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User registered successfully!")),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage(username: userName)),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      String message = "An error occurred!";

      switch (e.code) {
        case 'weak-password':
          message = "Password is too weak. Enter a strong password.";
          break;
        case 'email-already-in-use':
          message = "This email is already in use.";
          break;
        case 'invalid-email':
          message = "Invalid email address.";
          break;
        case 'network-request-failed':
          message = "Network error. Check your internet connection.";
          break;
        default:
          message = e.message ?? "An error occurred. Please try again.";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }
  //Log In

  Future<void> signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    final userEmail = email.trim().toLowerCase();
    final userPassword = password.trim();

    if (userEmail.isEmpty || userPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the fields")),
      );
      return;
    }
    if (!EmailValidator.validate(userEmail)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email address")),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      User? user = userCredential.user;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        Navigator.of(context).pop();

        if (userDoc.exists) {
          final data = userDoc.data() as Map<String, dynamic>;
          final username = data['username'] ?? 'User';

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(username: username),
            ),
            (route) => false,
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("User data not found.")));
        }
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      String message = "An error occurred. Please try again.";

      switch (e.code) {
        case 'user-not-found':
          message = "No user found with this email.";
          break;
        case 'wrong-password':
        case 'invalid-credential':
          message = "Invalid email or password.";
          break;

        case 'invalid-email':
          message = "Invalid email address.";
          break;

        case 'network-request-failed':
          message = "Network error. Check your internet connection.";
          break;
        case 'too-many-requests':
          message = "Too many requests. Try again later.";
          break;
        case 'user-disabled':
          message = "This user account has been disabled.";
          break;
        default:
          message = e.message ?? "An error occurred. Please try again.";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong. Please try again."),
        ),
      );
    }
  }

  Future sendOtp(BuildContext context, String email) async {
    final String useremail = email.trim().toLowerCase();

    if (useremail.isEmpty || !EmailValidator.validate(useremail)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid registered email address."),
        ),
      );
      return;
    }

    // Show loading dialog
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      // Check if the email exists by trying to sign in (without password)
      final List<String> methods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(useremail);

      if (methods.contains('password')) {
        // Email is registered, send reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(email: useremail);

        // Close loading dialog
        Navigator.of(context).pop();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password Reset Email Sent. Please check your mail."),
          ),
        );

        // Navigate to Login Page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      } else {
        // Email is not registered
        Navigator.of(context).pop(); // Close the loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "This email is not registered. Please try with another.",
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Close loading dialog
      Navigator.of(context).pop();

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "An error occurred. Try again.")),
      );
    }
  }
}

//   Future<void> sendOtp(BuildContext context, String email) async {
//     final userEmail = email.trim().toLowerCase();
//     if (userEmail.isEmpty || !EmailValidator.validate(userEmail)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please enter a valid email address")),
//       );
//       return;
//     }
//     // Show loading dialog
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => const Center(child: CircularProgressIndicator()),
//     );
//     try {
//       final List<String> methods = await _auth.fetchSignInMethodsForEmail(
//         userEmail,
//       );
//       print("Methods: $methods");
//       Navigator.of(context).pop(); // Close loading dialog

//       if (methods.isEmpty) {
//         // No account associated with this email
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("This email is not registered. Please try another."),
//           ),
//         );
//         return;
//       }
//       // Email exists with any sign-in method
//       await _auth.sendPasswordResetEmail(email: userEmail);

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Password Reset Email Sent. Please check your mail."),
//         ),
//       );
//       // timer = Timer.periodic(Duration(seconds: 5), (_)=>)
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => SignInPage()),
//       // );
//     } on FirebaseAuthException catch (e) {
//       Navigator.of(context).pop(); // Close loading dialog
//       String message = "An error occurred. Please try again.";
//       switch (e.code) {
//         case 'user-not-found':
//           message = "This email is not registered.";
//           break;
//         case 'invalid-email.':
//           message = "The email format is invalid.";
//           break;
//         case 'too-many-requests':
//           message = "Too many requests. Please try again later.";
//           break;
//         case 'not-registered-email':
//           message = "Too many requests. Please try again later.";
//           break;
//         default:
//           message = e.message ?? "An error occurred. Please try again.";
//       }
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(message)));
//     } catch (e) {
//       Navigator.of(context).pop(); // Close loading dialog for other errors

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Something went wrong. Please try again."),
//         ),
//       );
//     }
//   }

//   Future<void> fetchUser(String userId) async {
//     try {
//       DocumentSnapshot userDoc =
//           await FirebaseFirestore.instance
//               .collection('users')
//               .doc(userId)
//               .get();

//       if (userDoc.exists) {
//         print("User  data: ${userDoc.data()}");
//       } else {
//         print("No user found for the given ID.");
//       }
//     } catch (e) {
//       print("Error fetching user data: $e");
//     }
//   }
// }
