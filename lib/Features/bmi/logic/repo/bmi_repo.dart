import 'package:dartz/dartz.dart';
import 'package:gbsub/Core/services/faliure.dart';

abstract class IBMIRepo {
  Future<Either<Failure, bool>> postBMI({required Map data});
  // Future<Either<Failure, Float>> getBMILastVaLue({required int userId});
}
