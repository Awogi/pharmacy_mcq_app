import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../firebase_services/authentication.dart';
import '../firebase_services/formContainer.dart';
import '../pages/Login.dart';
import '../widget/constant_color.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import '../pages/Home_page.dart';
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
              top: MediaQuery.of(context).size.height *0.01,
              left: 0, // Added left positioning to ensure the container is full width
              right: 0,
              child: Container(
                width: double.infinity,
              height: MediaQuery.of(context).size.height *0.4,
              color: theme_blue,
            )),
            Positioned(
              top: MediaQuery.of(context).size.height *0.15,
              left: 0, // Added left positioning to ensure the container is full width
              right: 0,
              child: Text("Create",
             style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width *0.15,
                    fontFamily:"Ubuntu",
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.bold
                  ),
            )),
             Positioned(
              top: MediaQuery.of(context).size.height *0.25,
              left: 0, // Added left positioning to ensure the container is full width
              right: 0,
              child: Text("Account",
             style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width *0.15,
                    fontFamily:"Ubuntu",
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.bold
                  ),
            )),
            Positioned(
              top: MediaQuery.of(context).size.height *0.45,
              left:kIsWeb? MediaQuery.of(context).size.width *0.2:MediaQuery.of(context).size.width *0.1 ,
              right:kIsWeb? MediaQuery.of(context).size.width *0.2:MediaQuery.of(context).size.width *0.1,
              child: Container(
                width:kIsWeb? MediaQuery.of(context).size.width *0.7:MediaQuery.of(context).size.width *0.8 ,
                height:kIsWeb? MediaQuery.of(context).size.height *0.07: MediaQuery.of(context).size.width *0.4,
              child: FormContainer(
                prefixIcon: Icon(Icons.person),
                 controller: _userController,
              hintText: 'Name',
              isPasswordField: false,
              ),
            )),
            Positioned(
              top: MediaQuery.of(context).size.height *0.55,
              left:kIsWeb? MediaQuery.of(context).size.width *0.2:MediaQuery.of(context).size.width *0.1 ,
              right:kIsWeb? MediaQuery.of(context).size.width *0.2:MediaQuery.of(context).size.width *0.1,
              child: Container(
                width:kIsWeb? MediaQuery.of(context).size.width *0.7:MediaQuery.of(context).size.width *0.8 ,
                height:kIsWeb? MediaQuery.of(context).size.height *0.07: MediaQuery.of(context).size.width *0.4,
              child: FormContainer(
                prefixIcon: Icon(Icons.mail),
                 controller: _emailController,
              hintText: 'Mail',
              isPasswordField: false,
              ),
            )),
            Positioned(
              top: MediaQuery.of(context).size.height *0.65,
              left:kIsWeb? MediaQuery.of(context).size.width *0.2:MediaQuery.of(context).size.width *0.1 ,
              right:kIsWeb? MediaQuery.of(context).size.width *0.2:MediaQuery.of(context).size.width *0.1,
              child: Container(
                width:kIsWeb? MediaQuery.of(context).size.width *0.7:MediaQuery.of(context).size.width *0.8 ,
                height:kIsWeb? MediaQuery.of(context).size.height *0.07: MediaQuery.of(context).size.width *0.4,
              child: FormContainer(
                prefixIcon: Icon(Icons.password),
                 controller: _passwordController,
              hintText: 'password',
              isPasswordField: true,
              ),
            )),
            Positioned(
              top: MediaQuery.of(context).size.height *0.8,
              left:kIsWeb? MediaQuery.of(context).size.width *0.4:MediaQuery.of(context).size.width *0.1 ,
              right:kIsWeb? MediaQuery.of(context).size.width *0.4:MediaQuery.of(context).size.width *0.1,
              child:  GestureDetector(
                onTap: (){
                              Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                },
            child: Container(
              width:kIsWeb? MediaQuery.of(context).size.width *0.4:MediaQuery.of(context).size.width *0.5 ,
                height:kIsWeb? MediaQuery.of(context).size.height *0.07: MediaQuery.of(context).size.width *0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme_blue,
              ),
              child:  Center(
                child: Text(
                  'sign Up',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily:"Ubuntu",
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
            )


            ],
          ),

        ),
        
       
        );
  }

  void _signUp() async {
    String username = _userController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      Navigator.pushNamed(context, '/home');
    } else {
      const ScaffoldMessenger(
        child: SnackBar(content: Text("Some Error Occured")),
      );
    }
  }
}
