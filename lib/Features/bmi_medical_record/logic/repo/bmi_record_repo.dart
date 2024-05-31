import 'package:dartz/dartz.dart';
import 'package:gbsub/Core/services/faliure.dart';
import 'package:gbsub/Features/bmi_medical_record/data/bmi_data_model.dart';

abstract class BMIRecordrepo {
  Future<Either<Failure, bool>> deleteBMI(int bmiId);
  Future<Either<Failure, List<BmiReads>>> fethcAllReadsForUser(int userId);
}
