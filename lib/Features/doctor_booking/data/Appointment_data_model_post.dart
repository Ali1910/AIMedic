class AppointmentDataModel {
  final int id;
  final int timeId;
  final int doctorId;
  final String datetime;
  final bool empty;

  AppointmentDataModel({
    required this.id,
    required this.timeId,
    required this.doctorId,
    required this.datetime,
    required this.empty,
  });
  factory AppointmentDataModel.fromjson(json) {
    return AppointmentDataModel(
        id: json['id'],
        timeId: json['timeId'],
        doctorId: json['doctorId'],
        datetime: json['datetime'],
        empty: json['empty']);
  }
}
