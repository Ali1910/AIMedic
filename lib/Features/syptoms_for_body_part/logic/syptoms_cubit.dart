import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/syptoms_for_body_part/data/symptoms_model.dart';
import 'package:gbsub/Features/syptoms_for_body_part/logic/syptoms_states.dart';

class SyptomsCubit extends Cubit<SyptomsStates> {
  SyptomsCubit() : super(SyptomsInitState());
  List<Symptoms> listOfSymptoms = [];
  List<bool> listOfBools = [];

  Future<List<Symptoms>> getSyptomsForBodyPart(int id) async {
    final dio = Dio();
    listOfSymptoms = [];
    listOfBools = [];
    var response = await dio.get('$baseUrl/Syptoms?id=$id');
    for (var element in response.data) {
      Symptoms symptoms = Symptoms.json(element);
      listOfSymptoms.add(symptoms);
      listOfBools.add(false);
    }
    return listOfSymptoms;
  }

  void chageBool(index) {
    listOfBools[index] = !listOfBools[index];
    emit(SyptomsSucessState());
  }
}
