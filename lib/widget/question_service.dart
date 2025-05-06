import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/question.dart';

class QuestionService {
  // Fetch grouped questions (used for tabbed/all subjects view)
  static Future<Map<String, List<Question>>> fetchQuestionsGroupedBySubject() async {
    final snapshot = await FirebaseFirestore.instance.collection('questions').get();

    Map<String, List<Question>> groupedQuestions = {};

    for (var doc in snapshot.docs) {
      Question question = Question.fromMap(doc.id, doc.data());
      groupedQuestions.putIfAbsent(question.subject, () => []);
      groupedQuestions[question.subject]!.add(question);
    }

    return groupedQuestions;
  }

  // ✅ New: Fetch questions for a specific subject
  static Future<List<Question>> fetchQuestionsBySubject(String subject) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('questions')
        .where('subject', isEqualTo: subject)
        .get();

    return snapshot.docs.map((doc) => Question.fromMap(doc.id, doc.data())).toList();
  }
}
