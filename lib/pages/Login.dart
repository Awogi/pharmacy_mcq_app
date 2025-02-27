import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/pages/Home_page.dart';
import '../widget/constant_color.dart';
import '../firebase_services/authentication.dart';
import '../firebase_services/formContainer.dart';
import '../pages/sign_up.dart';
import '../pages/Send_Otp.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
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
                "Welcome",
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
                "Back",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.15,
                  fontFamily: "Ubuntu",
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
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
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.73,
              left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.6
                      : MediaQuery.of(context).size.width * 0.1,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SendOtp()),
                  );
                },
                child: Text(
                  "Forgot password ?",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.02,
                    fontFamily: "Ubuntu",
                    color: themeblue,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.8,
              left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              child: GestureDetector(
                onTap: _LogIn,
                child: Container(
                  width:
                      kIsWeb
                          ? MediaQuery.of(context).size.width * 0.6
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
                      'Log In',
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

                child: Text("Don't you have an account?"),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.6,
              child: Container(
                width:
                    kIsWeb
                        ? MediaQuery.of(context).size.width * 0.8
                        : MediaQuery.of(context).size.width * 0.5,
                height:
                    kIsWeb
                        ? MediaQuery.of(context).size.height * 0.09
                        : MediaQuery.of(context).size.width * 0.2,

                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text("Sign Up"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _LogIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill all the fields.")),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred. Please try again.";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email address.";
      } else if (e.code == 'too-many-requests') {
        errorMessage = "Too many requests. Try again later.";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An unexpected error occurred.")),
      );
    }
  }
}
