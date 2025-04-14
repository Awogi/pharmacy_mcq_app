import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/widget/constant_color.dart';
import 'package:pharmacy_mcq_app/widget/navigation_bar.dart';
import 'package:provider/provider.dart';
import '../widget/Color_theme_provider.dart';
import '../pages/Diploma_in_Pharmacy.dart';
import '../pages/Bachelors_in_Pharmacy.dart';
import '../widget/navigation_bar.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  final TextEditingController user = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:NavBar() ,
      // appBar: AppBar(
      //   // title: Center(
      //   //   child: Text(
      //   //     "Pharmacy License Practice Question",
      //   //     style: TextStyle(
      //   //       fontSize: MediaQuery.of(context).size.width * 0.03,
      //   //       fontFamily: "Ubuntu",
      //   //       color: Theme.of(context).textTheme.bodyLarge?.color,
      //   //       fontWeight: FontWeight.bold,
      //   //     ),
      //   //   ),
      //   // ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      //       },
      //       icon: Icon(
      //         Icons.wb_sunny,
      //         color: Theme.of(context).iconTheme.color== Colors.black? Colors.white:Colors.black,
      //       ),S
      //     ),
      //   ],
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.37,
                decoration: BoxDecoration(
                  color: themeblue,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30),
                    left: Radius.circular(30),
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
              top: MediaQuery.of(context).size.height * (-0.03),
              left: MediaQuery.of(context).size.width * (0.8),
              right: MediaQuery.of(context).size.width * (-0.1),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                  color: themegreylight,
                  shape: BoxShape.circle,
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
              top: MediaQuery.of(context).size.height * (-0.05),
              left: MediaQuery.of(context).size.width * (-0.3),
              right: MediaQuery.of(context).size.width * 0.2,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.63,
                height: MediaQuery.of(context).size.height * 0.38,
                decoration: BoxDecoration(
                  color: themegreylight,
                  shape: BoxShape.circle,
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
              top: MediaQuery.of(context).size.height * 0.06,
              right: MediaQuery.of(context).size.width * 0.05,
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
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.85,
              child: Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },

                    icon: Icon(
                      Icons.menu,
                      color:
                          Theme.of(context).iconTheme.color == Colors.black
                              ? Colors.white
                              : Colors.black,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.85,
              right: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                child: IconButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).toggleTheme();
                  },
                  icon: Icon(
                    Icons.person,
                    color:
                        Theme.of(context).iconTheme.color == Colors.black
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.01,
              child: Text(
                " Welcome ",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontFamily: "Ubuntu",
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.01,
              child: Text(
                widget.username,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontFamily: "Ubuntu",
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.43,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DiplomaInPharmacy(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: MediaQuery.of(context).size.height * 0.05,
                        color:
                            Theme.of(context).iconTheme.color == Colors.black
                                ? Colors.white
                                : Colors.black,
                      ),
                      Text(
                        "  Diploma in Pharmacy ",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontFamily: "Ubuntu",
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.55,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BachelorsInPharmacy(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: MediaQuery.of(context).size.height * 0.05,
                        color:
                            Theme.of(context).iconTheme.color == Colors.black
                                ? Colors.white
                                : Colors.black,
                      ),
                      Text(
                        "  Bachelors in Pharmacy ",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontFamily: "Ubuntu",
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
