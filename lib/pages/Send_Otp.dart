import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/firebase_services/authentication.dart';
import 'package:pharmacy_mcq_app/firebase_services/form_container.dart';
import 'package:pharmacy_mcq_app/widget/constant_color.dart';

class SendOtp extends StatefulWidget {
  const SendOtp({super.key});

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  final AuthenticationService _auth = AuthenticationService();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    // _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.27,
              decoration: BoxDecoration(
                color: themeblue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.06,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                width: MediaQuery.of(context).size.height * 0.04,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: BoxDecoration(
                  color: themeblue,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(8),
                    left: Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.043,
              left: MediaQuery.of(context).size.width * 0.018,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.chevron_left,
                  color:
                      Theme.of(context).iconTheme.color == Colors.black
                          ? Colors.white
                          : Colors.black,
                ),
                iconSize: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.06,
              left: MediaQuery.of(context).size.width * 0.15,
              child: Text(
                "Recover your Password",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontFamily: "Ubuntu",
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.1,
              child: SizedBox(
                // width:
                //     kIsWeb
                //         ? MediaQuery.of(context).size.width * 0.7
                //         : MediaQuery.of(context).size.width * 0.8,
                // height:
                //     kIsWeb
                //         ? MediaQuery.of(context).size.height * 0.07
                //         : MediaQuery.of(context).size.width * 0.4,
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
              top: MediaQuery.of(context).size.height * 0.45,
              left:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.4
                      : MediaQuery.of(context).size.width * 0.1,
              right:
                  kIsWeb
                      ? MediaQuery.of(context).size.width * 0.4
                      : MediaQuery.of(context).size.width * 0.1,
              child: GestureDetector(
                onTap: () {
                  _auth.sendOtp(context, _emailController.text);
                },
                child: Container(
                  // width:
                  //     kIsWeb
                  //         ? MediaQuery.of(context).size.width * 0.4
                  //         : MediaQuery.of(context).size.width * 0.5,
                  // height:
                  //     kIsWeb
                  //         ? MediaQuery.of(context).size.height * 0.07
                  //         : MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themeblue,
                  ),
                  child: Center(
                    child: Text(
                      'Reset Password',
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
          ],
        ),
      ),
    );
    // body: Stack(
    //   children: [

    //     Positioned(
    //       top: MediaQuery.of(context).size.height * 0.5,
    //       // left:
    //       //     kIsWeb
    //       //         ? MediaQuery.of(context).size.width * 0.2
    //       //         : MediaQuery.of(context).size.width * 0.1,
    //       // right:
    //       //     kIsWeb
    //       //         ? MediaQuery.of(context).size.width * 0.2
    //       //         : MediaQuery.of(context).size.width * 0.1,
    //       child: SizedBox(
    //         width:
    //             kIsWeb
    //                 ? MediaQuery.of(context).size.width * 0.7
    //                 : MediaQuery.of(context).size.width * 0.8,
    //         height:
    //             kIsWeb
    //                 ? MediaQuery.of(context).size.height * 0.07
    //                 : MediaQuery.of(context).size.width * 0.4,
    //         child: FormContainer(
    //           prefixIcon: Icon(Icons.mail),
    //           controller: _emailController,
    //           hintText: 'Mail',
    //           validator:
    //               (email) =>
    //                   email != null && !EmailValidator.validate(email)
    //                       ? 'Enter a valid email'
    //                       : null,
    //           isPasswordField: false,
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       top: MediaQuery.of(context).size.height * 0.8,
    //       left:
    //           kIsWeb
    //               ? MediaQuery.of(context).size.width * 0.4
    //               : MediaQuery.of(context).size.width * 0.1,
    //       right:
    //           kIsWeb
    //               ? MediaQuery.of(context).size.width * 0.4
    //               : MediaQuery.of(context).size.width * 0.1,
    //       child: GestureDetector(
    //         onTap: resetPassword,
    //         child: Container(
    //           width:
    //               kIsWeb
    //                   ? MediaQuery.of(context).size.width * 0.4
    //                   : MediaQuery.of(context).size.width * 0.5,
    //           height:
    //               kIsWeb
    //                   ? MediaQuery.of(context).size.height * 0.07
    //                   : MediaQuery.of(context).size.width * 0.2,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             color: themeblue,
    //           ),
    //           child: Center(
    //             child: Text(
    //               'Reset Password',
    //               style: TextStyle(
    //                 fontSize: 14,
    //                 fontFamily: "Ubuntu",
    //                 color: Theme.of(context).textTheme.bodyLarge?.color,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
  }
}
