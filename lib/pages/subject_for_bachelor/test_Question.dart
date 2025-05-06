import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/widget/Each_Question_model.dart';
class TestQuestions extends StatefulWidget {
  const TestQuestions({super.key});

  @override
  State<TestQuestions> createState() => _TestQuestionsState();
}

class _TestQuestionsState extends State<TestQuestions> {
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
