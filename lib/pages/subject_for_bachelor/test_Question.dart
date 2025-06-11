import 'package:flutter/material.dart';
import 'package:pharmacy_mcq_app/widget/Each_Question_model.dart';

class TestQuestions extends StatefulWidget {
  const TestQuestions({super.key});

  @override
  State<TestQuestions> createState() => _TestQuestionsState();
}

class _TestQuestionsState extends State<TestQuestions> {
  // Example list of test names
  final List<String> testList = [
    "Test 1",
    "Test 2",
    "Test 3",
    "Test 4",
    "Test 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Tests")),
      body: ListView.builder(
        itemCount: testList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(testList[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EachQuestionModel(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
