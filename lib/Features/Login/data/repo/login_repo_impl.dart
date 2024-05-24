import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/services/faliure.dart';
import 'package:gbsub/Features/Login/data/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final APiService aPiService;
  LoginRepoImpl({required this.aPiService});
  @override
  Future<Either<Failure, dynamic>> login(
      {required String email, required String password}) async {
    try {
      var data = await aPiService.get(
          endpoint: '/User?email=$email&password=$password');
      return right(data.data);
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
