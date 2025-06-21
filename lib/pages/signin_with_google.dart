// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:pharmacy_mcq_app/pages/home_page.dart';

// class GoogleAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

//   Future<User?> signInwithGoogle(BuildContext context) async {
//     try {
//       final googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) return null;
//       //Retrieve the authentication details from the Goggle Account
//       final googleAuth = await googleUser.authentication;
//       //Create a new credential using the Goggle authentication details
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       //Sign in to firebase with the google Credential
//       final userCredential = await _auth.signInWithCredential(credential);
//       if (userCredential.user != null && context.mounted) {
//         // Navigate to HomePage after successful sign-in
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder:
//                 (context) => HomePage(
//                   username: userCredential.user!.uid,
//                   email: userCredential.user!.email ?? '',
//                 ),
//           ),
//         );
//       }
//       return userCredential.user;
//     } catch (e) {
//       print("Google sign-in error: $e"); // <-- this helps identify the issue

//       await showDialog(
//         context: context,
//         builder:
//             (_) => AlertDialog(
//               title: Text("Error"),
//               content: Text("Sign In Error: $e"), // <-- show the actual error
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text("OK"),
//                 ),
//               ],
//             ),
//       );
//       return null;
//     }
//   }

//   /// Signout the user from both Google and Firebase.
//   Future<void> signOut() async {
//     await _googleSignIn.signOut();

//     // Sign out from Firebase.
//     await _auth.signOut();
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_mcq_app/pages/home_page.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'], // Scopes for accessing user profile
  );
  Future<void> signInwithGoogle(BuildContext context) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      // Trigger Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        Navigator.of(context).pop(); // Close loading dialog
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user != null) {
        // Retrieve Firebase UID
        String googleId = user.uid;
        String displayName = user.displayName ?? 'User';
        String email = user.email ?? '';

        // Save user data to Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'googleId': googleId,
          'username': displayName,
          'email': email,
          'role': 'user',
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

        // Close loading dialog
        Navigator.of(context).pop();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signed in with Google successfully!")),
        );

        // Navigate to HomePage
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(username: displayName, email: email),
          ),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close loading dialog
      String message = 'An error occurred during Google Sign-In.';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          message = 'This account is linked with a different sign-in method.';
          break;
        case 'invalid-credential':
          message = 'Invalid Google credentials.';
          break;
        case 'network-request-failed':
          message = 'Network error. Check your internet connection.';
          break;
        default:
          message = e.message ?? 'An error occurred. Please try again.';
      }
      await showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Google Sign-In Error'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    } catch (e) {
      Navigator.of(context).pop(); // Close loading dialog
      await showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Error'),
              content: const Text('Something went wrong. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }
}
