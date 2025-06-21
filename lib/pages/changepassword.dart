import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/firebase_services/form_container.dart';
import 'package:pharmacy_mcq_app/pages/log_in.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPwController = TextEditingController();
  final TextEditingController _newPwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  @override
  void dispose() {
    _oldPwController.dispose();
    _newPwController.dispose();
    _confirmPwController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              FormContainer(
                prefixIcon: Icon(Icons.password),
                controller: _oldPwController,
                hintText: 'Old Password',
                isPasswordField: true,
                validator:
                    (password) =>
                        password != null && password.length < 8
                            ? 'Enter a previous password'
                            : null,
              ),
              FormContainer(
                prefixIcon: Icon(Icons.password),
                controller: _newPwController,
                hintText: 'New Password',
                isPasswordField: true,
                validator:
                    (password) =>
                        password != null && password.length < 8
                            ? 'Enter a strong password of at least 8 length character'
                            : null,
              ),
              FormContainer(
                prefixIcon: Icon(Icons.password),
                controller: _confirmPwController,
                hintText: 'Confirm Password',
                isPasswordField: true,
                validator:
                    (password) =>
                        password != null && password.length < 8
                            ? 'Enter a strong password of at least 8 length character'
                            : null,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: _changePassword,
                    child: const Text("Change Password"),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _changePassword() async {
    final email = _emailController.text.trim();
    final oldPw = _oldPwController.text.trim();
    final newPw = _newPwController.text.trim();
    final confirmPw = _confirmPwController.text.trim();
    if (newPw.isEmpty || newPw.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password must be at least 6 characters")),
      );
      return;
    }

    if (newPw != confirmPw) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text('Not Matched'),
              content: Text('New password and Confirm Password did not match'),
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

    setState(() => _isLoading = true);

    try {
      final user = FirebaseAuth.instance.currentUser!;

      //re-authenticate with old
      final credential = EmailAuthProvider.credential(
        email: email,
        password: oldPw,
      );
      //update to new password
      await user.updatePassword(newPw);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password updated successfully")),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => SignInPage()),
        (route) => false,
      );

      // Go back to previous screen
    } on FirebaseAuthException catch (e) {
      setState(() => _isLoading = false);
      String message = "Failed to change password.";
      switch (e.code) {
        case 'wrong-password':
          message = "Old password is incorrect.";
          break;
        case 'weak-password':
          message = "New password is too weak.";
          break;
        case 'requires-recent-login':
          message = "Please log in again and retry.";
          break;
        default:
          message = e.message ?? message;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
