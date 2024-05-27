import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/body_parts/data/body_part_model.dart';
import 'package:gbsub/Features/body_parts/logic/diagnosis_states.dart';

class DiagnosisCubit extends Cubit<DiagnosisStates> {
  DiagnosisCubit() : super(DiagnosisInitState());
  List<BodyPart> listofBodyParts = [];

  Future<List<BodyPart>> getBodyParts() async {
    final dio = Dio();
    listofBodyParts = [];
    var response = await dio.get('$baseUrl/BodyPart');
    for (var element in response.data) {
      BodyPart bodypart = BodyPart.json(element);
      listofBodyParts.add(bodypart);
    }
    return listofBodyParts;
  }

  void CSV() async {
    var stream =
        await rootBundle.loadString('assets/files/يوم تخرج تكريمي (1-55).csv');
    var data = CsvToListConverter(eol: '\r').convert(stream);
    print(data[0][5]);
  }
}
