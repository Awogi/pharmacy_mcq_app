import 'package:flutter/material.dart';
import '../widget/question.dart';
class QuestionTile extends StatelessWidget {
  final Question question;

  const QuestionTile({required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(question.question),
        subtitle: Text("Correct Answer: ${question.correctAnswer}"),
      ),
    );
  }
}
