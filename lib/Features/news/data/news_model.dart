class ArticalModel {
  String? image;
  final String title;
  final String url;
  ArticalModel({required this.image, required this.title, required this.url});

  factory ArticalModel.fromJson(json) {
    return ArticalModel(
        image: json['urlToImage'] ??
            'https://th.bing.com/th/id/OIP.bZKSn6D2rxlET7dPSVvT9gHaE0?rs=1&pid=ImgDetMain',
        title: json['title'],
        url: json['url']);
  }
}
