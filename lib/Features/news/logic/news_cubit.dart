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
    emit(LoadingState());
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=c4c64b07d449441ba98ec6107ca8ed8b&category=health',
    );
    // .timeout(
    //   const Duration(seconds: 5),
    // );

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
