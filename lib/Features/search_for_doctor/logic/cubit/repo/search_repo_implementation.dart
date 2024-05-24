import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/services/faliure.dart';
import 'package:gbsub/Features/picking_doctor_booking/data/doctor_data_model.dart';
import 'package:gbsub/Features/search_for_doctor/logic/cubit/repo/search_repo.dart';

class SearchRepoImplementation extends SearchRepo {
  final APiService aPiService;

  SearchRepoImplementation({required this.aPiService});
  @override
  Future<Either<Failure, List<DoctorDataModel>>> getDoctorByName(
      String name, String spec) async {
    List<DoctorDataModel> listOfDoctor = [];
    try {
      var response = await aPiService.get(
          endpoint: '/Doctor/GetDoctorname?Name=$name&spec=$spec');
      for (var element in response.data) {
        DoctorDataModel doctorDataModel = DoctorDataModel.fromjson(element);
        listOfDoctor.add(doctorDataModel);
      }
      return right(listOfDoctor);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromdioException(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
