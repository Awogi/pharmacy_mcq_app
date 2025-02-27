import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/firebase_services/authentication.dart';
import 'package:pharmacy_mcq_app/firebase_services/formContainer.dart';
import 'package:pharmacy_mcq_app/pages/Home_page.dart';
import 'package:pharmacy_mcq_app/pages/Login.dart';
import 'package:pharmacy_mcq_app/widget/constant_color.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendOtp extends StatefulWidget {
  const SendOtp({super.key});

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            // left:
            //     kIsWeb
            //         ? MediaQuery.of(context).size.width * 0.2
            //         : MediaQuery.of(context).size.width * 0.1,
            // right:
            //     kIsWeb
            //         ? MediaQuery.of(context).size.width * 0.2
            //         : MediaQuery.of(context).size.width * 0.1,
            child: Container(
              width:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.7
                      : MediaQuery.of(context).size.width * 0.8,
              height:
                  kIsWeb
                      ? MediaQuery.of(context).size.height * 0.07
                      : MediaQuery.of(context).size.width * 0.4,
              child: FormContainer(
                prefixIcon: Icon(Icons.mail),
                controller: _emailController,
                hintText: 'Mail',
                validator:
                    (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                isPasswordField: false,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.8,
            left:
                kIsWeb
                    ? MediaQuery.of(context).size.width * 0.4
                    : MediaQuery.of(context).size.width * 0.1,
            right:
                kIsWeb
                    ? MediaQuery.of(context).size.width * 0.4
                    : MediaQuery.of(context).size.width * 0.1,
            child: GestureDetector(
              onTap: resetPassword,
              child: Container(
                width:
                    kIsWeb
                        ? MediaQuery.of(context).size.width * 0.4
                        : MediaQuery.of(context).size.width * 0.5,
                height:
                    kIsWeb
                        ? MediaQuery.of(context).size.height * 0.07
                        : MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeblue,
                ),
                child: Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Ubuntu",
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future resetPassword() async {
    String email = _emailController.text.trim();

    if (email.isEmpty || !EmailValidator.validate(email)) {
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
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email).then((
        methods,
      ) async {
        if (methods.isNotEmpty) {
          // Email is registered, send reset email
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

          // Close loading dialog
          Navigator.of(context).pop();

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Password Reset Email Sent. Please check your mail.",
              ),
            ),
          );

          // Navigate to Login Page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SignInPage()),
          );
        } else {
          // Email is not registered
          Navigator.of(context).pop(); // Close the loading dialog
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "This email is not registered. Please enter a valid email.",
              ),
            ),
          );
        }
      });
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
