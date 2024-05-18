class Symptoms {
  final String name;
  Symptoms({required this.name});
  factory Symptoms.json(json) {
    return Symptoms(name: json['symptomInArabic']);
  }
}
