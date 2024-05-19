class AnswerModel {
  final Answer answer;
  final Doctor doctor;
  final Speciality speciality;
  AnswerModel(
      {required this.answer, required this.doctor, required this.speciality});
  factory AnswerModel.json(healthJson, doctorJson, specialityJson) {
    return AnswerModel(
        answer: Answer.json(healthJson),
        doctor: Doctor.json(doctorJson),
        speciality: Speciality.json(specialityJson));
  }
}

class Answer {
  final String content;
  final int id;
  Answer({required this.id, required this.content});
  factory Answer.json(json) {
    return Answer(id: json['id'], content: json['content']);
  }
}

class Doctor {
  final String doctorName;
  final String doctorPic;
  Doctor({required this.doctorName, required this.doctorPic});
  factory Doctor.json(json) {
    return Doctor(
      doctorPic: json['profilePic'],
      doctorName: json['name'],
    );
  }
}

class Speciality {
  final String spec;
  Speciality({required this.spec});
  factory Speciality.json(json) {
    return Speciality(spec: json['name']);
  }
}
