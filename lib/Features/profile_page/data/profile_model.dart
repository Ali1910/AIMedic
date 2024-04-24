class ProfileModel {
  final String name;
  final String email;
  final String pic;
  final String gender;
  final String pN;
  final String city;

  ProfileModel(
      {required this.email,
      required this.name,
      required this.pic,
      required this.city,
      required this.gender,
      required this.pN});
  factory ProfileModel.fromjson(json) {
    return ProfileModel(
        name: json['name'],
        pic: json['profilePic'],
        email: json['email'],
        city: json['city'],
        gender: json['gender'],
        pN: json['phoneNumber']);
  }
}
