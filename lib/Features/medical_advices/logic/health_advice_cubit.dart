import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/medical_advices/data/medical_advice_model.dart';
import 'package:gbsub/Features/medical_advices/logic/health_advice_states.dart';

class HealthAdviceCubit extends Cubit<HealthAdviceStates> {
  HealthAdviceCubit() : super(HealthInitialStates());

  List<HealthAdviceModel> healthAdvices = [];
  Future<List<HealthAdviceModel>> getAdvices() async {
    final dio = Dio();
    healthAdvices = [];
    try {
      emit(HealthLoadingStates());
      var response =
          await dio.get('$baseUrl/HealthAdvice?pageNum=1&pagesize=10');
      for (int i = 0; i < response.data['healthAdvice'].length; i++) {
        HealthAdviceModel healthAdviceModel = HealthAdviceModel.json(
            response.data['healthAdvice'][i],
            response.data['doctor'][i],
            response.data['spec'][i]);
        healthAdvices.add(healthAdviceModel);
      }
      emit(HealthSuccessStates());
      return healthAdvices;
    } catch (erorr) {
      emit(HealthFailingStates());
      print(erorr.toString());
      return healthAdvices;
    }
  }
}
