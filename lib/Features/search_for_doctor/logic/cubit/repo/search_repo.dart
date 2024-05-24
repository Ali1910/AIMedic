import 'package:dartz/dartz.dart';
import 'package:gbsub/Core/services/faliure.dart';
import 'package:gbsub/Features/picking_doctor_booking/data/doctor_data_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<DoctorDataModel>>> getDoctorByName(
      String name, String spec);
}
