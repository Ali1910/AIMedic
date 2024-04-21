// import 'package:dio/dio.dart';
// import 'package:qrduation_project/features/News/data/news_model.dart';

// class NewsServices {
//   final Dio dio;
//   NewsServices(this.dio);
//   Future<List<ArticalModel>> getMedicalNews() async {
//     Response response = await dio.get(
//         'https://newsapi.org/v2/top-headlines?country=eg&apiKey=c4c64b07d449441ba98ec6107ca8ed8b&category=health');
//     Map<String, dynamic> jsonDate = response.data;
//     List<dynamic> articles = jsonDate['articles'];
//     List<ArticalModel> articlesList = [];

//     for (var element in articles) {
//       ArticalModel articalModel = ArticalModel(
//         image: element['urlToImage'],
//         subTitle: element['author'],
//         title: element['title'],
//         url: element['url'],
//       );
//       articlesList.add(articalModel);
//     }
//     return articlesList;
//   }
// }
