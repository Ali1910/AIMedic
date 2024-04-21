class DoctorDataModel {
  final String name;
  final String city;
  final String pic;
  final int fee;
  final String phoneNumber;
  final String university;
  final int id;

  DoctorDataModel(
      {required this.city,
      required this.fee,
      required this.name,
      required this.id,
      required this.phoneNumber,
      required this.pic,
      required this.university});
  factory DoctorDataModel.fromjson(json) {
    return DoctorDataModel(
      city: json['city'],
      fee: json['fee'],
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      pic: json['profilePic'],
      university: json['universiry'],
    );
  }
}
