import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/widget/constant_color.dart';
import 'package:pharmacy_mcq_app/pages/subject_for_bachelor/Test_Question.dart';

class ModelQuestion1 extends StatefulWidget {
  const ModelQuestion1({super.key});

  @override
  State<ModelQuestion1> createState() => _ModelQuestion1State();
}

class _ModelQuestion1State extends State<ModelQuestion1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
         
           children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0,
               left: MediaQuery.of(context).size.width * 0,
               right: 0,
                child: Container(
                              // width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.27,
                              decoration: BoxDecoration(
                                color: Color(0xFF01949a),
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
                   color: Color(0xFF01949a),
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
                 "Model Questions",
                 style: TextStyle(
                   fontSize: MediaQuery.of(context).size.width * 0.07,
                   fontFamily: "Ubuntu",
                   color: Theme.of(context).textTheme.bodyLarge?.color,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             Positioned(
               top: MediaQuery.of(context).size.height * 0.35,
               left: MediaQuery.of(context).size.width * 0.1,
               right: MediaQuery.of(context).size.width * 0.1,
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                      decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
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
                       width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.2,
                       child: GestureDetector(
                         onTap: () {
                            Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (TestQuestions()),
                      ),
                    );
                         },
                         child: Column(
                          
                           children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                             Row(
                               children: [
                                SizedBox(width: MediaQuery.of(context).size.width * 0.05 ,),
                                 Text(
                                   "Test \nQuestions",
                                   style: TextStyle(
                                     fontSize:
                                         MediaQuery.of(context).size.width * 0.05,
                                     fontFamily: "Ubuntu",
                                     color:
                                         Theme.of(
                                           context,
                                         ).textTheme.bodyLarge?.color,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                    width:  MediaQuery.of(context).size.width * 0.1,
                   ),
                   Expanded(
                     child: Container(
                       decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
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
                       width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.2,
                       child: GestureDetector(
                         child: Column(

                           children: [
                             SizedBox(height: MediaQuery.of(context).size.height * 0.04 ,),
                             Row(
                               children: [
                                SizedBox(width: MediaQuery.of(context).size.width * 0.05 ,),
                                 Text(
                                   " Solved \nQuestions",
                                   style: TextStyle(
                                     fontSize:
                                         MediaQuery.of(context).size.width * 0.05,
                                     fontFamily: "Ubuntu",
                                     color:
                                         Theme.of(
                                           context,
                                         ).textTheme.bodyLarge?.color,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),

            // Subjects List (Fixed)
        ),
      );
  }
}
