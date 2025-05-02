import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../firebase_services/authentication.dart';
import '../firebase_services/form_container.dart';
import 'login.dart';
import '../widget/constant_color.dart';
import 'package:flutter/foundation.dart';
import '../pages/Home_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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
              top: MediaQuery.of(context).size.height * 0,
              left:MediaQuery.of(context).size.width * 0,
                  // Added left positioning to ensure the container is full width
              right: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    color: themeblue,
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(30),left: Radius.circular(30) ),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(3, 3),
                    ),]
                ),
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
                  fontSize: MediaQuery.of(context).size.width * 0.12,
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
                  fontSize: MediaQuery.of(context).size.width * 0.12,
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
                        : MediaQuery.of(context).size.width * 0.18,
    
                decoration: BoxDecoration(
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(3, 3),
                    ),]
                ),
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
                        : MediaQuery.of(context).size.width * 0.18,
                decoration: BoxDecoration(
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(3, 3),
                    ),]
                ),
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
                        : MediaQuery.of(context).size.width * 0.18,
                decoration: BoxDecoration(
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(3, 3),
                    ),]
                ),
                child: FormContainer(
                  prefixIcon: Icon(Icons.password),
                  controller: _passwordController,
                  hintText: 'password',
                  isPasswordField: true,
                  validator:
                      (password) =>
                          password != null && password.length < 8
                              ? 'Enter a strong password of at least 8 length character'
                              : null,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.75,
              left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              child: GestureDetector(
                onTap: _signUp,
                child: Container(
                  width:
                      kIsWeb
                          ? MediaQuery.of(context).size.width * 0.3
                          : MediaQuery.of(context).size.width * 0.2,
                  height:
                      kIsWeb
                          ? MediaQuery.of(context).size.height * 0.07
                          : MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    color: themeblue,
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(3, 3),
                    ),]
                ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
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
              top: MediaQuery.of(context).size.height * 0.83,
               left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.35
                      : MediaQuery.of(context).size.width * 0.23,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.25
                      : MediaQuery.of(context).size.width * 0.1,
                
            
                
      
                child: Text("Already have an account?",
                style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontFamily: "Ubuntu",
                      color:
                          Theme.of(context).textTheme.bodyLarge?.color ==
                                  themelight
                              ? Colors.black
                              : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.83,
               left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.63
                      : MediaQuery.of(context).size.width * 0.64,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.25
                      : MediaQuery.of(context).size.width * 0.2,
      
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  child: Text("Log In",
                   style: TextStyle(
                      fontSize:MediaQuery.of(context).size.width * 0.02,
                      fontFamily: "Ubuntu",
                      color:themeblue,
                      fontWeight: FontWeight.bold,
                    ),
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
      User? user = await FirebaseAuthService().createUserWithEmailAndPassword(
  _userController.text,
  _emailController.text,
  _passwordController.text,
);

      // Dismiss the loading dialog
      if (mounted) Navigator.of(context).pop();
      if (user != null) {
        await FirebaseFirestore.instance
    .collection('users')
    .doc(user.uid)
    .set({'username': _userController.text,'email':_emailController});

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage(username:"username", email:"email")),
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
