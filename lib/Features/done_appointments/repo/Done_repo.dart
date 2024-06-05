import 'package:dartz/dartz.dart';
import 'package:gbsub/Core/services/faliure.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';

abstract class DoneRepo {
  Future<Either<Failure, List<AppointmentDateModelDTO>>> fetchDoneAppointments(
      int userId);
}
