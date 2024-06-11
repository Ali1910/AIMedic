import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/diabetes_preidiction/logic/diabetes_states.dart';

class DiabetesCubit extends Cubit<DiabetesStates> {
  DiabetesCubit() : super(DiabetesInitialState());

  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final Dio dio = Dio();
  String bmi = "";
  String bloodpressure = "";
  String glucose = "";
  late String prediction = "";
  bool predicted = false;
  void onchageglucose(value) {
    glucose = value;
    emit(FormKeyInputChanged());
  }

  void onchagebmi(value) {
    bmi = value;
    emit(FormKeyInputChanged());
  }

  void onchagebloodpressure(value) {
    bloodpressure = value;
    emit(FormKeyInputChanged());
  }

  Future<void> predict() async {
    try {
      var response = await dio.post(
          'http://10.0.2.2:5000/predict?Glucose=${double.parse(glucose)}&BloodPressure=${double.parse(bloodpressure)}&BMI=${double.parse(bmi)}');

      if (response.data['prediction'] == "1") {
        emit(PredictionSuccsess());
        predicted = true;
        prediction = "أنت مصاب بمرض السكرى يرجى متابعة الطبيب";
      } else {
        emit(PredictionSuccsess());
        predicted = true;
        prediction = "أنت سليم ومعافى الحمدلله";
      }
    } on Exception catch (e) {
      emit(PredictionFailed());
      prediction = "حدث خطا ما حاول مرة اخرى";
    }
  }
}
