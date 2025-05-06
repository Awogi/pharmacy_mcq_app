class TestQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  TestQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory TestQuestion.fromMap(Map<String, dynamic> data) {
  return TestQuestion(
    question: data['question']?.toString() ?? 'No question provided',
    options: data['options'] != null
        ? List<String>.from(data['options'])
        : <String>[],
    correctAnswerIndex: data['correctAnswerIndex'] is int
        ? data['correctAnswerIndex']
        : 0,
  );
}
}
