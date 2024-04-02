class AppointmentDateModelDTO {
  final int id;
  final int dcotorid;
  final int timeid;
  final String year;
  final String month;
  final String day;
  final String appointmentTime;
  final String doctorPic;
  final String doctorName;
  final String doctorNum;
  final String doctorSpec;

  AppointmentDateModelDTO(
      {required this.appointmentTime,
      required this.day,
      required this.dcotorid,
      required this.doctorName,
      required this.doctorNum,
      required this.doctorPic,
      required this.doctorSpec,
      required this.id,
      required this.month,
      required this.timeid,
      required this.year});

  factory AppointmentDateModelDTO.fromjson(json) {
    return AppointmentDateModelDTO(
        appointmentTime: json['appointmentTime'],
        day: json['day'],
        dcotorid: json['doctorid'],
        doctorName: json['doctorname'],
        doctorNum: json['doctoNum'],
        doctorPic: json['doctorpic'],
        doctorSpec: json['doctorspec'],
        id: json['id'],
        month: json['month'],
        timeid: json['timeid'],
        year: json['year']);
  }
}
