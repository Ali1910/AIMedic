import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/news/data/news_model.dart';
import 'package:gbsub/Features/news/logic/news_states.dart';

class NewsCubit extends Cubit<NeWsStates> {
  NewsCubit() : super(InitialState());

  final Dio dio = Dio();
  List newsarticals = [];
  bool imageNotload = true;

  Future<List<ArticalModel>> getMedicalNews() async {
    const String url = 'https://newsapi.org/v2/top-headlines';
    final Map<String, dynamic> queryParameters = {
      'country': 'us',
      'category': 'health',
      'apiKey': '638a8092b9fa4d139e1d4ad0dee76a36'
    };
    emit(LoadingState());
    var response = await dio.get(url, queryParameters: queryParameters);
    Map<String, dynamic> jsonDate = response.data;
    List<dynamic> articles = jsonDate['articles'];
    List<ArticalModel> articlesList = [];

    for (var element in articles) {
      ArticalModel articalModel = ArticalModel.fromJson(element);
      articlesList.add(articalModel);
    }
    print(articlesList[1].image);
    newsarticals = articlesList;
    emit(SucessState());
    return articlesList;
  }
}
