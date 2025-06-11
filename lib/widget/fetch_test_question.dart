import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/test_model_question.dart';

Future<List<TestQuestion>> fetchTestQuestions(String subject) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('test_questions')
      .where('subject', isEqualTo: subject)
      .get();

  if (snapshot.docs.isEmpty) return [];

  final allQuestions = snapshot.docs.expand((doc) {
    final data = doc.data();
    final questions = List<Map<String, dynamic>>.from(data['questions']);
    return questions;
  }).toList();

  return allQuestions.map((q) => TestQuestion.fromMap(q)).toList();
}

