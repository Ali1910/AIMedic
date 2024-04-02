import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';

import 'package:gbsub/Features/picking_doctor/data/doctor_data_model.dart';
import 'package:gbsub/Features/picking_doctor/logic/cubit_states.dart';

class DoctorCubit extends Cubit<DoctorPickingStates> {
  DoctorCubit() : super(DoctorPickingInitialState());
  final Dio dio = Dio();
  List<DoctorDataModel> doctors = [];
  Future<List<DoctorDataModel>> getdoctor(String specialityName) async {
    doctors = [];
    var response = await dio
        .get('$baseUrl/Doctor/GetDoctorByspecialty?specialty=$specialityName');

    for (var element in response.data) {
      DoctorDataModel doctor = DoctorDataModel.fromjson(element);
      doctors.add(doctor);
    }
    print(doctors[0].name);
    return doctors;
  }
}
