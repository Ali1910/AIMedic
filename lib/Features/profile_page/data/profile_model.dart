class ProfileModel {
  final String name;
  final String email;
  final String pic;

  ProfileModel({
    required this.email,
    required this.name,
    required this.pic,
  });
  factory ProfileModel.fromjson(json) {
    return ProfileModel(
        name: json['name'], pic: json['pic'], email: json['email']);
  }
}
