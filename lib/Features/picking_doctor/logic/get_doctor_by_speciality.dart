import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gbsub/Features/picking_doctor/data/doctor_data_model.dart';
import 'package:gbsub/Features/picking_doctor/logic/cubit_states.dart';

class DoctorCubit extends Cubit<DoctorPickingStates> {
  DoctorCubit() : super(DoctorPickingInitialState());
  final Dio dio = Dio();
  DoctorDataModel x = DoctorDataModel(
      city: 'المنصورة',
      fee: 500,
      name: '',
      phoneNumber: '01015274115',
      pic: 'pic',
      university: 'university',
      id: 1);
  List<DoctorDataModel> doctors = [];
  Future<List<DoctorDataModel>> getdoctor(String specialityName) async {
    doctors = [];
    var response = await dio.get(
        'https://10.0.2.2:7093/api/Doctor/GetDoctorByspecialty?specialty=${specialityName}');

    for (var element in response.data) {
      DoctorDataModel doctor = DoctorDataModel.fromjson(element);
      doctors.add(doctor);
    }
    print(doctors[0].name);
    return doctors;
  }
}
