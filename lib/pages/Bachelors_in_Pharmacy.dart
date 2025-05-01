import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/pages/subject_for_bachelor.dart/subject5.dart';
import '../widget/constant_color.dart';
import '../widget/subjecttile.dart';
import '../pages/subject_for_bachelor.dart/subject1.dart';
import '../pages/subject_for_bachelor.dart/subject2.dart';
import '../pages/subject_for_bachelor.dart/subject3.dart';
import '../pages/subject_for_bachelor.dart/subject4.dart';

class BachelorsInPharmacy extends StatefulWidget {
  const BachelorsInPharmacy({super.key});

  @override
  State<BachelorsInPharmacy> createState() => _BachelorsInPharmacyState();
}

class _BachelorsInPharmacyState extends State<BachelorsInPharmacy> {
  final List<String> subjects = [
    "Pharmaceutics",
    "Pharmaceutical Chemistry",
    "Pharmacology & Toxicology",
    "Community Pharmacy",
    "Model Questions",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            // Header Section
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
              child: Stack(
                children: [
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
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.width * 0.15,
                    child: Text(
                      "Diploma in Pharmacy",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        fontFamily: "Ubuntu",
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Subjects List (Fixed)
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children:
                    subjects
                        .map(
                          (subject) => SubjectTile(
                            title: subject,
                            onTap: () {
                              if (subject == "Pharmaceutics") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Subject1(),
                                  ),
                                );
                              } else if (subject ==
                                  "Pharmaceutical Chemistry") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Subject2(),
                                  ),
                                );
                              } else if (subject ==
                                  "Pharmacology & Toxicology") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Subject3(),
                                  ),
                                );
                              } else if (subject == "Community Pharmacy") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Subject4(),
                                  ),
                                );
                              } else if (subject == "Model Questions") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ModelQuestionB(),
                                  ),
                                );
                              }
                            },
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
