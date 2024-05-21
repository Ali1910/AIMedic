import 'package:dartz/dartz.dart';
import 'package:gbsub/Core/services/faliure.dart';

abstract class LoginRepo {
  Future<Either<Failure, dynamic>> login(
      {required String email, required String password});
}
