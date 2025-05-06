import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/widget/Each_Question_model.dart';
class TestQuestions1 extends StatefulWidget {
  const TestQuestions1({super.key});

  @override
  State<TestQuestions1> createState() => _TestQuestions1State();
}

class _TestQuestions1State extends State<TestQuestions1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            children: [
              GestureDetector(
                onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EachQuestionModel(),
                      ),
                    );
                },
                child: Text("Test1"),
              )
            ],
          ),
        ),
    );
  }
}
