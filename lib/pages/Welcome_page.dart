import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:pharmacy_mcq_app/pages/Home_page.dart';
import 'package:pharmacy_mcq_app/pages/login.dart';
import 'package:pharmacy_mcq_app/widget/navigate_pages.dart';
import '../widget/constant_color.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var pagenavigator = Provider.of<PageNavigator>(context, listen: false);
    pagenavigator.setContext(context);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top:
                  MediaQuery.of(context).size.height *
                  0.01, // Adjust this value for positioning
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width:
                      kIsWeb
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.9,
                  height:
                      kIsWeb
                          ? MediaQuery.of(context).size.height * 0.6
                          : MediaQuery.of(context).size.height * 0.6,
                  child: Image.asset("assets/images/undraw_medicine_hqqg.png"),
                ),
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height * 0.6, // Adjust this value for positioning
              left:MediaQuery.of(context).size.width* 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: kIsWeb ? 20 : 5),
                  // SizedBox(width: 5,),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Hello! Welcome to Nepal Pharmacy License ",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width* 0.03 ,
                        fontFamily: "Ubuntu",
                        color: (Theme.of(context).textTheme.bodyLarge?.color)==themelight?Colors.black:Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(width: 5,),
                  //  SizedBox(width: 5,),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Practice.",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width* 0.03,
                        fontFamily: "Ubuntu",
                        color: (Theme.of(context).textTheme.bodyLarge?.color)==themelight?Colors.black:Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //  SizedBox(width: 5,),
                  // SizedBox(height: 5,),
                  // SizedBox(width: 5,),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Prepare for your exam by practicing questions ",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width* 0.03,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        color: (Theme.of(context).textTheme.bodyLarge?.color)==themelight?Colors.black:Colors.white,
                      ),
                    ),
                  ),
                  // SizedBox(width: 5,),
                  // SizedBox(width: 5,),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "and testing your knowledge at your own pace.",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width* 0.03,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        color: (Theme.of(context).textTheme.bodyLarge?.color)==themelight?Colors.black:Colors.white,
                      ),
                    ),
                  ),
                  // SizedBox(width: 5,),
                ],
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height *
                  0.8, // Adjust this value for positioning
              left: MediaQuery.of(context).size.width * 0.3,
              right: MediaQuery.of(context).size.width * 0.3,
              child: Container(
                width: 30,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    pagenavigator.navigateNextPage(const SignInPage());
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: themeblue),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
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
  }
}
