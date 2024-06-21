import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/medical_visits/data/medical_visits.dart';
import 'package:gbsub/Features/medical_visits/logic/medical_visits_state.dart';

class MedicalVisitsCubit extends Cubit<MedicalVisitsState> {
  MedicalVisitsCubit(this.dio) : super(MedicalVisitsInitial());
  List<MedicalVisitsDataModel> medicalVisits = [];
  final Dio dio;

  Future<void> getMedicalVisitsForUser() async {
    try {
      medicalVisits = [];
      emit(GetMedicalVistisLoading());
      var respone = await dio.get(
          '$baseUrl/Diagnosis/GetDiagnosisForAuser?userid=${Sharedhelper.getintdata(intkey)}');
      for (var element in respone.data) {
        MedicalVisitsDataModel medicalvisit =
            MedicalVisitsDataModel.fromJson(element);
        medicalVisits.add(medicalvisit);
      }
      emit(GetMedicalVistisSuccess());
    } catch (ex) {
      emit(GetMedicalVistisFailed());
    }
  }
}
