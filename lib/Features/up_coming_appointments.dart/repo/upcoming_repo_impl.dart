import 'package:dartz/dartz.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/services/faliure.dart';
import 'package:gbsub/Core/utilts/widgets/exception_method.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/repo/upcoming_repo.dart';

class UpcomingRepoImpl extends UpcomingRepo {
  final APiService aPiService;

  UpcomingRepoImpl(this.aPiService);
  @override
  Future<Either<Failure, List<AppointmentDateModelDTO>>>
      fetchUPcomingAppointments(int userId) async {
    List<AppointmentDateModelDTO> listOfAppointment = [];
    try {
      var response = await aPiService.get(
          endpoint:
              '/AppointmentContoller/GetUserAppointments?userId=$userId&state=${false}');
      for (var element in response.data) {
        AppointmentDateModelDTO appointment =
            AppointmentDateModelDTO.fromjson(element);
        listOfAppointment.add(appointment);
      }
      return right(listOfAppointment);
    } catch (ex) {
      return left(exceptionMethod(ex));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUpcomingappointmnet(int appid) async {
    try {
      var repsponse = await aPiService.delete(
          endpoint: '/AppointmentContoller?AppontmentId=$appid');
      return right(repsponse.data);
    } catch (ex) {
      return left(exceptionMethod(ex));
    }
  }
}
