class DoctorDataModel {
  final String name;
  final String city;
  final String pic;
  final int fee;
  final String phoneNumber;
  final String university;
  final int id;
  final String rating;
  final String loaction;

  DoctorDataModel(
      {required this.city,
      required this.fee,
      required this.name,
      required this.id,
      required this.phoneNumber,
      required this.pic,
      required this.university,
      required this.rating,
      required this.loaction});
  factory DoctorDataModel.fromjson(json) {
    return DoctorDataModel(
        city: json['city'],
        fee: json['fee'],
        id: json['id'],
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        pic: json['profilePic'],
        university: json['universiry'],
        rating: json['rating'].toStringAsFixed(2),
        loaction: json['location']);
  }
}
