import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../widget/constant_color.dart';
import '../pages/Login.dart';
import '../widget/Navigate_pages.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var pagenavigator = Provider.of<PageNavigator>(context,listen: false);
    pagenavigator.SetContext(context);
    return Scaffold(
      body: Container(
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
                child: Container(
                  width: kIsWeb ? 500 : 300,
                  height: kIsWeb ? 500 : 300,
                  child: Image.asset("assets/images/undraw_medicine_hqqg.png"),
                ),
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height *
                  0.6, // Adjust this value for positioning
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: kIsWeb ? 20 : 5),
                  // SizedBox(width: 5,),
                  Text("Hello! Welcome to Nepal Pharmacy License ",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily:"Ubuntu",
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  // SizedBox(width: 5,),
                  //  SizedBox(width: 5,),
                   Text("Practice.",
                   style: TextStyle(
                     fontSize: 14,
                     fontFamily:"Ubuntu",
                     color: Theme.of(context).textTheme.bodyLarge?.color,
                     fontWeight: FontWeight.bold
                   ),
                   ),
                  //  SizedBox(width: 5,),
                  // SizedBox(height: 5,),
                  // SizedBox(width: 5,),
                  Text(
                    "Prepare for your exam by practicing questions ",
                    style: TextStyle(
                    fontSize: 14,
                    fontFamily:"Ubuntu",
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    )
                  ),
                  // SizedBox(width: 5,),
                  // SizedBox(width: 5,),
                  Text(
                    "and testing your knowledge at your own pace.",
                    style: TextStyle(
                    fontSize: 14,
                    fontFamily:"Ubuntu",
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    )
                    
                  ),
                  // SizedBox(width: 5,),
                ],
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height *
                  0.8, // Adjust this value for positioning
              left: MediaQuery.of(context).size.width *0.3,
              right:MediaQuery.of(context).size.width*0.3,
              child: Container(
                width:30,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: ElevatedButton(
                  onPressed: () {
                   pagenavigator. Navigate_next_Page(const SignInPage());
                  },
                  style:ElevatedButton.styleFrom(
                    backgroundColor: theme_blue,
                  ),
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
              )
            )
          ],
        ),
      ),
    );
  }
}
