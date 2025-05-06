class Question {
  final String id;
  final String question;
  final String subject;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.subject,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromMap(String id, Map<String, dynamic> data) {
    return Question(
      id: id,
      question: data['question'],
      subject: data['subject'],
      options: List<String>.from(data['options']),
      correctAnswer: data['correctAnswer'],
    );
  }
}
