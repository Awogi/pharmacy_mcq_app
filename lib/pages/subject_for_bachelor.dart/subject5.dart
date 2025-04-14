import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/widget/constant_color.dart';
import '../subject_for_bachelor.dart/Solved_model_Question.dart';
import '../subject_for_bachelor.dart/Test_Questions.dart';

class modelQuestionB extends StatefulWidget {
  const modelQuestionB({super.key});

  @override
  State<modelQuestionB> createState() => _modelQuestionBState();
}

class _modelQuestionBState extends State<modelQuestionB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
              Positioned(
              top: MediaQuery.of(context).size.height * 0,
              left: 0,
              right: 0,
              child: Container(
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
                      child:Container(
                        width:  MediaQuery.of(context).size.height * 0.04,
                        height:  MediaQuery.of(context).size.height * 0.04,
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
                    ),]
                        ),
                      )
                    ),

                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.043,
                      left: MediaQuery.of(context).size.width * 0.018,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.chevron_left,
                            color: Theme.of(context).iconTheme.color == Colors.black
                                ? Colors.white
                                : Colors.black),
                                iconSize:MediaQuery.of(context).size.height * 0.05 ,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.05,
                      left: MediaQuery.of(context).size.width * 0.15,
                      child: Text(
                        "Model Questions",
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
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
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
                            builder: (context) =>  solvedQuestions(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            "  Solved Model ",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                              fontFamily: "Ubuntu",
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "  Questions ",
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
                  SizedBox(
                    width:MediaQuery.of(context).size.width * 0.02 ,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
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
                            builder: (context) =>  testQuestion(),
                          ),
                        );
                      },
                      child: Text(
                        "  Test Questions ",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontFamily: "Ubuntu",
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}