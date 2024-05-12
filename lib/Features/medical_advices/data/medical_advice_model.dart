class HealthAdviceModel {
  final HealthAdvice healthAdvice;
  final Doctor doctor;
  final Speciality speciality;
  HealthAdviceModel(
      {required this.healthAdvice,
      required this.doctor,
      required this.speciality});
  factory HealthAdviceModel.json(healthJson, doctorJson, specialityJson) {
    return HealthAdviceModel(
        healthAdvice: HealthAdvice.json(healthJson),
        doctor: Doctor.json(doctorJson),
        speciality: Speciality.json(specialityJson));
  }
}

class HealthAdvice {
  final String content;
  final int id;
  HealthAdvice({required this.id, required this.content});
  factory HealthAdvice.json(json) {
    return HealthAdvice(id: json['id'], content: json['content']);
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
