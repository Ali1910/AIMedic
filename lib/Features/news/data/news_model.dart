class ArticalModel {
  String? image;
  final String title;
  final String url;
  ArticalModel({required this.image, required this.title, required this.url});

  factory ArticalModel.fromJson(json) {
    return ArticalModel(
        image: json['urlToImage'] ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhejU9teYGOjPZ5ENQ2iTi7AOuY1VfaT9ksEQ2cl6YF3daWr1sEDxWF11iYyJ2XcTNCls&usqp=CAU',
        title: json['title'],
        url: json['url']);
  }
}
