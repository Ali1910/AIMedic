class QuestionDetails {
  final Question question;
  final User user;

  QuestionDetails({required this.question, required this.user});

  factory QuestionDetails.json(json1, json2) {
    return QuestionDetails(
      question: Question.json(json1),
      user: User.json(json2),
    );
  }
}

class Question {
  final int id;
  final String content;
  final bool answered;

  Question({required this.answered, required this.id, required this.content});

  factory Question.json(json) {
    return Question(
        id: json['id'], content: json['content'], answered: json['answered']);
  }
}

class User {
  final String gender;

  User({required this.gender});
  factory User.json(json) {
    return User(gender: json['gender']);
  }
}
