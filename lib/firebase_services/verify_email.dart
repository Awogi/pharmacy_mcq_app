// // import 'package:email_validator/email_validator.dart';
// // import 'package:flutter/material.dart';
// // import 'package:pharmacy_mcq_app/firebase_services/form_container.dart';

// // import 'package:email_auth/email_auth.dart';

// // class VerifyEMail extends StatefulWidget {
// //   final String initialEmail;
// //   const VerifyEMail({super.key, this.initialEmail = " "});

// //   @override
// //   State<VerifyEMail> createState() => _VerifyEMailState();
// // }

// // class _VerifyEMailState extends State<VerifyEMail> {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _otpController = TextEditingController();
// //   late EmailAuth emailAuth;

// //   @override
// //   void initState() {
// //     super.initState();
// //     emailAuth = EmailAuth(sessionName: "Test");
// //     _emailController.text = widget.initialEmail;
// //     if (widget.initialEmail.isNotEmpty) ;
// //     sendOtp();
// //   }

// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     _otpController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Verify Email')),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: FormContainer(
// //                     prefixIcon: Icon(Icons.mail),
// //                     controller: _emailController,
// //                     hintText: 'Mail',
// //                     validator:
// //                         (email) =>
// //                             email != null && !EmailValidator.validate(email)
// //                                 ? 'Enter a rgistered email'
// //                                 : null,
// //                     isPasswordField: false,
// //                   ),
// //                 ),

// //                 ElevatedButton(onPressed: sendOtp, child: Text('Send Otp')),
// //               ],
// //             ),

// //             FormContainer(
// //               // prefixIcon: Icon(Icons.mail),
// //               controller: _otpController,
// //               hintText: 'OTP',
// //               isPasswordField: false,
// //             ),

// //             ElevatedButton(onPressed: verifyOtp, child: Text('Verify OTP')),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void sendOtp() async {
// //     bool res = await emailAuth.sendOtp(
// //       recipientMail: _emailController.text.trim(),
// //     );
// //     if (res) {
// //       ScaffoldMessenger.of(
// //         context,
// //       ).showSnackBar(SnackBar(content: Text('OTP Sent')));
// //     } else {
// //       ScaffoldMessenger.of(
// //         context,
// //       ).showSnackBar(SnackBar(content: Text('Failed to send OTP')));
// //     }
// //   }

// //   void verifyOtp() async {
// //     bool isValid = emailAuth.validateOtp(
// //       recipientMail: _emailController.text.trim(),
// //       userOtp: _otpController.text.trim(),
// //     );
// //     // Navigator.pushAndRemoveUntil(
// //     //   context,
// //     //   MaterialPageRoute(
// //     //     builder: (context) => HomePage(),
// //     //   ),
// //     //   (route) => false,
// //     // );
// //   }
// // }

// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:email_auth/email_auth.dart';
// import 'package:pharmacy_mcq_app/firebase_services/form_container.dart';
// import 'package:pharmacy_mcq_app/pages/home_page.dart';

// // Define your remote backend config here or import it
// const Map<String, String> remoteServerConfiguration = {
//   "server": "https://your-backend-url.com", // Your deployed backend URL here
//   "serverKey": "123456", // Must match your backend server key
// };

// class VerifyEMail extends StatefulWidget {
//   final String initialEmail;
//   final String username;
//   const VerifyEMail({super.key, this.initialEmail = '', this.username = ''});

//   @override
//   State<VerifyEMail> createState() => _VerifyEMailState();
// }

// class _VerifyEMailState extends State<VerifyEMail> {
//   final _emailController = TextEditingController();
//   final _otpController = TextEditingController();
//   late final EmailAuth emailAuth;

//   @override
//   void initState() {
//     super.initState();

//     emailAuth = EmailAuth(sessionName: 'Quiz App')
//       ..config(remoteServerConfiguration); //

//     _emailController.text = widget.initialEmail.trim();

//     if (_emailController.text.isNotEmpty) {
//       sendOtp(); // auto‑send for pre‑filled mail
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _otpController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Verify Email')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: FormContainer(
//                     prefixIcon: const Icon(Icons.mail),
//                     controller: _emailController,
//                     hintText: 'Email',
//                     validator:
//                         (mail) =>
//                             (mail == null || !EmailValidator.validate(mail))
//                                 ? 'Enter a registered email'
//                                 : null,
//                     isPasswordField: false,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 ElevatedButton(
//                   onPressed: sendOtp,
//                   child: const Text('Send OTP'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             FormContainer(
//               controller: _otpController,
//               hintText: 'Enter OTP',
//               isPasswordField: false,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: verifyOtp,
//               child: const Text('Verify OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> sendOtp() async {
//     final mail = _emailController.text.trim();
//     if (!EmailValidator.validate(mail)) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Invalid email')));
//       return;
//     }

//     final ok = await emailAuth.sendOtp(recipientMail: mail);
//     final msg = ok ? 'OTP sent to $mail' : 'Failed to send OTP';
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }

//   Future<void> verifyOtp() async {
//     final valid = emailAuth.validateOtp(
//       recipientMail: _emailController.text.trim(),
//       userOtp: _otpController.text.trim(),
//     );

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(valid ? 'OTP verified' : 'Invalid OTP')),
//     );
//     if (valid) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder:
//               (_) => HomePage(
//                 username: widget.username,
//                 email: _emailController.text.trim(),
//               ),
//         ),
//       );
//     }
//   }
// }
