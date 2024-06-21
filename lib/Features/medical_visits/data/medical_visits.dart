class MedicalVisitsDataModel {
  final String summaryofthesession;
  final String maindisease;
  final String date;

  MedicalVisitsDataModel(
      {required this.summaryofthesession,
      required this.maindisease,
      required this.date});

  factory MedicalVisitsDataModel.fromJson(json) {
    return MedicalVisitsDataModel(
        summaryofthesession: json['summaryOfTheSession'],
        maindisease: json['mainDiseases'],
        date: json['datetime']);
  }
}
