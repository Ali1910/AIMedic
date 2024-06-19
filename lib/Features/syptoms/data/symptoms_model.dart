class Symptoms {
  final String name;
  final String eName;
  Symptoms({required this.name, required this.eName});
  factory Symptoms.json(json) {
    return Symptoms(
        name: json['symptomInArabic'], eName: json['symptomInEnglish']);
  }
}
