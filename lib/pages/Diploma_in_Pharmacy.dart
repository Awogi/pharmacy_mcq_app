import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/pages/subject_for_diploma/Model_Question.dart';
import 'package:pharmacy_mcq_app/pages/subject_for_diploma/test_Question1.dart';
import '../widget/constant_color.dart';
import '../widget/subjecttile.dart';
import '../widget/subject_wise_question_screen.dart';

class DiplomaInPharmacy extends StatefulWidget {
  const DiplomaInPharmacy({super.key});

  @override
  State<DiplomaInPharmacy> createState() => _DiplomaInPharmacyState();
}

class _DiplomaInPharmacyState extends State<DiplomaInPharmacy> {
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
  if (subject == "Pharmaceutics" ||
      subject == "Pharmaceutical Chemistry" ||
      subject == "Pharmacology & Toxicology" ||
      subject == "Community Pharmacy") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubjectWiseQuestionsScreen(subject: subject),
      ),
    );
  } else if (subject == "Model Questions") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ModelQuestion(),
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
