import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/Color_theme_provider.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Consumer<ThemeProvider>(
        builder: (context,themeProvider,child){
        return Center(
          child: Container(
            width:kIsWeb? 200: 100,
            height: kIsWeb? 200:100,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: ClipOval(child: Image.asset("assets/images/Nepal_Pharmacy_Counsil.png",
            fit: BoxFit.cover,
            ))),

        );
        }
      ),
    );
  }
}
