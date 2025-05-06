// question_provider.dart
import 'package:flutter/material.dart';
import 'question.dart';
import 'question_service.dart';

class QuestionProvider with ChangeNotifier {
  Map<String, List<Question>> _questionsBySubject = {};
  bool _isLoading = false;
  String? _error;

  List<Question> getQuestionsBySubject(String subject) {
    return _questionsBySubject[subject] ?? [];
  }

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchQuestionsForSubject(String subject) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final allQuestions = await QuestionService.fetchQuestionsGroupedBySubject();
      _questionsBySubject = allQuestions;
    } catch (e) {
      _error = "Failed to load questions";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
