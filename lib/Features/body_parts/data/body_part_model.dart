class BodyPart {
  final String name;
  final String nameInEnglish;
  final int id;
  BodyPart({required this.name, required this.id, required this.nameInEnglish});
  factory BodyPart.json(json) {
    return BodyPart(
      name: json['bodypartInArabic'],
      id: json['id'],
      nameInEnglish: json['bodypartInEnglis'],
    );
  }
}
