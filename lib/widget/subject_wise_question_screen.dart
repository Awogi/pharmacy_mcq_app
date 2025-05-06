import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/questionTile.dart';
import '../widget/question_provider.dart';

class SubjectWiseQuestionsScreen extends StatefulWidget {
  final String subject;

  const SubjectWiseQuestionsScreen({Key? key, required this.subject}) : super(key: key);

  @override
  State<SubjectWiseQuestionsScreen> createState() => _SubjectWiseQuestionsScreenState();
}

class _SubjectWiseQuestionsScreenState extends State<SubjectWiseQuestionsScreen> {
  bool _isFirstLoad = true;

  @override
  @override
void didChangeDependencies() {
  super.didChangeDependencies();
  if (_isFirstLoad) {
    _isFirstLoad = false;

    // Defer the call to after the current build
    Future.microtask(() {
      Provider.of<QuestionProvider>(context, listen: false)
          .fetchQuestionsForSubject(widget.subject);
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.subject} Questions")),
      body: Consumer<QuestionProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          final questions = provider.getQuestionsBySubject(widget.subject);

          if (questions.isEmpty) {
            return const Center(child: Text("No questions found."));
          }

          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return QuestionTile(question: questions[index]);
            },
          );
        },
      ),
    );
  }
}
