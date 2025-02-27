import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../firebase_services/authentication.dart';
import '../firebase_services/formContainer.dart';
import 'login.dart';
import '../widget/constant_color.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import '../pages/Home_page.dart';
import 'package:email_validator/email_validator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuthService _auth =
      FirebaseAuthService(); // Create an instance of `FirebaseAuthService` to handle authentication logic.

  //manage input from text fields.
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the `TextEditingController` instances to free up resources when the widget is removed.
    _userController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.01,
              left:
                  0, // Added left positioning to ensure the container is full width
              right: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                color: themeblue,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left:
                  0, // Added left positioning to ensure the container is full width
              right: 0,
              child: Text(
                "Create",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.15,
                  fontFamily: "Ubuntu",
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left:
                  0, // Added left positioning to ensure the container is full width
              right: 0,
              child: Text(
                "Account",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.15,
                  fontFamily: "Ubuntu",
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
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
                  prefixIcon: Icon(Icons.person),
                  controller: _userController,
                  hintText: 'Name',
                  isPasswordField: false,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.55,
              left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
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
              top: MediaQuery.of(context).size.height * 0.65,
              left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
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
                  prefixIcon: Icon(Icons.password),
                  controller: _passwordController,
                  hintText: 'password',
                  isPasswordField: true,
                  validator:
                      (password) =>
                          password != null && password.length < 8
                              ? 'Enter a strong password of atleast 8 length character'
                              : null,
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
                onTap: _signUp,
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
                      'Sign Up',
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

            Positioned(
              top: MediaQuery.of(context).size.height * 0.9,
              child: Container(
                width:
                    kIsWeb
                        ? MediaQuery.of(context).size.width * 0.4
                        : MediaQuery.of(context).size.width * 0.5,
                height:
                    kIsWeb
                        ? MediaQuery.of(context).size.height * 0.09
                        : MediaQuery.of(context).size.width * 0.2,

                child: Text("Already have an account?"),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.8,
              child: Container(
                width:
                    kIsWeb
                        ? MediaQuery.of(context).size.width * 0.4
                        : MediaQuery.of(context).size.width * 0.5,
                height:
                    kIsWeb
                        ? MediaQuery.of(context).size.height * 0.09
                        : MediaQuery.of(context).size.width * 0.2,

                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  child: Text("Sign In"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    if (_emailController.text == "" ||
        _passwordController.text == "" ||
        _userController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the fields.")),
      );
      return; // Exit the function if any field is empty
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      User? user = await _auth.createUserWithEmailAndPassword(
        _userController.text,
        _emailController.text,
        _passwordController.text,
      );
      // Dismiss the loading dialog
      if (mounted) Navigator.of(context).pop();
      if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sign-up failed. Please try again.")),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) Navigator.of(context).pop();
      String errorMessage = "An error occurred. Please try again.";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      } else if (e.code == 'invalid username') {
        errorMessage = "Incorrect username.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email address.";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      if (mounted) Navigator.of(context).pop(); // Ensure the dialog is closed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An unexpected error occurred.")),
      );
    }
  }
}
