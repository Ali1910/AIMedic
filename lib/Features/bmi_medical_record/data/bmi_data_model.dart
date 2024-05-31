class BmiReads {
  final int id;
  final String value;
  final String year;
  final String month;
  final String day;
  final String hour;
  final String minute;

  BmiReads(
      {required this.id,
      required this.day,
      required this.hour,
      required this.minute,
      required this.month,
      required this.value,
      required this.year});

  factory BmiReads.json(json) {
    return BmiReads(
        id: json['id'],
        day: json['day'],
        hour: json['hour'],
        minute: json['minute'],
        month: json['month'],
        value: json['value'].toString(),
        year: json['year']);
  }
}
