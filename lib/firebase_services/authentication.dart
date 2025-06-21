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
      await showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Missing Fields"),
              content: Text("Please fill all the fields."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
      return;
    }

    if (userName.length <= 2) {
      await showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              content: Text("Username must be more than 2 characters."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
      return;
    }

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(child: CircularProgressIndicator()),
    // );

    try {
      /*  Create Firebase user */
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: userEmail,
            password: userPassword,
          );

      User? user = userCredential.user;
      /* Save user info in Firestore */
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': userName,
          'email': userEmail,
          'role': 'user',
          'createdAt': FieldValue.serverTimestamp(),
        });

        /* ▸ Send Firebase verification link */
        await user.sendEmailVerification();
        /* ▸ Inform & redirect to login */
        await showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: Text("Verify Your Email"),
                content: Text(
                  "A verification link has been sent to $userEmail.\n\n"
                  "Please verify first, then log in.",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const SignInPage()),
          (_) => false,
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
          await _auth.signOut();
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
      await showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Sign Up Error"),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
      return;
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
      await showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Missing Fields"),
              content: Text("Please fill all the fields."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
      return;
    }
    if (!EmailValidator.validate(userEmail)) {
      await showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Invalid Email"),
              content: Text("Please enter a valid email address"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );

      return;
    }

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (_) => const Center(child: CircularProgressIndicator()),
    // );

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await _auth.signOut();
        await showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: Text("E-mail Not Verified"),
                content: Text(
                  "Please verify your e-mail first.\n"
                  "Didn't get it? Check spam or tap 'Resend Verification' on the login screen.",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
        );
        if (user != null) {
          DocumentSnapshot userDoc =
              await _firestore.collection('users').doc(user.uid).get();

          // Navigator.of(context).pop();

          if (userDoc.exists) {
            final data = userDoc.data() as Map<String, dynamic>;
            final username = data['username'] ?? 'User';

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => HomePage(username: username, email: userEmail),
              ),
              (route) => false,
            );
          }
        } else {
          await showDialog(
            context: context,
            builder:
                (_) => AlertDialog(
                  content: Text("User data not found."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
          );
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
      await showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
    } catch (e) {
      Navigator.of(context).pop();
      await showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              content: Text("Something went wrong. Please try again."),

              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
    }
  }

  Future sendOtp(BuildContext context, String email) async {
    final String useremail = email.trim().toLowerCase();

    if (useremail.isEmpty || !EmailValidator.validate(useremail)) {
      await showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Invalid Email"),
              content: Text("Please enter a valid registered email address."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
      return;
    }

    // Show loading dialog
    showDialog(
      context: context,
      builder: (_) => const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      // Check if the email exists by trying to sign in (without password)
      final List<String> methods = await _auth.fetchSignInMethodsForEmail(
        useremail,
      );
      if (methods.isEmpty) {
        // Not registered at all
        Navigator.of(context).pop(); // close loader
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text('Not Registered'),
                content: Text(
                  "This email is not registered. Please try with another",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
        );
        return;
      }

      if (methods.contains('password')) {
        // Email is registered, send reset email
        await _auth.sendPasswordResetEmail(email: useremail);

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
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                content: Text(
                  "This email is not registered. Please try with another",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
        );
        return;
      }
    } on FirebaseAuthException catch (e) {
      // Close loading dialog
      Navigator.of(context).pop();
      String message = "An error occured. Please try again.";
      switch (e.code) {
        case 'user-not-found':
          message = "This email is not registered.";
          break;
        case 'invalid-email.':
          message = "The email format is invalid.";
          break;
        case 'too-many-requests':
          message = "Too many requests. Please try again later.";
          break;
        case 'not-registered-email':
          message = "Too many requests. Please try again later.";
          break;
        default:
          message = e.message ?? "An error occurred. Please try again.";
      }

      // Show error message
      await showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
    }
  }

  Future<void> changePassword(String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await user.updatePassword(newPassword);
        print("Password updated successfully.");
      } on FirebaseAuthException catch (e) {
        print("Error: ${e.code}");
        // If error is "requires-recent-login", ask user to re-login first
      }
    }
  }
}
