import 'package:dartz/dartz.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/services/faliure.dart';
import 'package:gbsub/Core/utilts/widgets/exception_method.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';

import 'package:gbsub/Features/done_appointments/repo/Done_repo.dart';

class DoneRepoImpl extends DoneRepo {
  final APiService aPiService;

  DoneRepoImpl(this.aPiService);
  @override
  Future<Either<Failure, List<AppointmentDateModelDTO>>> fetchDoneAppointments(
      int userId) async {
    List<AppointmentDateModelDTO> listOfAppointment = [];
    try {
      var response = await aPiService.get(
          endpoint:
              '/AppointmentContoller/GetUserDoneAppointments?userId=$userId');
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
}
