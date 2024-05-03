class ArticalModel {
  String? image;
  final String title;
  final String url;
  ArticalModel({required this.image, required this.title, required this.url});

  factory ArticalModel.fromJson(json) {
    return ArticalModel(
        image: json['urlToImage'] ?? 'null',
        title: json['title'],
        url: json['url']);
  }
}
