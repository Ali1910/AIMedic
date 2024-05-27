import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/services/faliure.dart';
import 'package:gbsub/Features/bmi/logic/repo/bmi_repo.dart';

class BMIRepoImpl extends IBMIRepo {
  final APiService aPiService;

  BMIRepoImpl({required this.aPiService});
  @override
  // Future<Either<Failure, Float>> getBMILastVaLue({required int userId}) {
  //   var response = aPiService.get(endpoint: endpoint);
  // }

  @override
  Future<Either<Failure, bool>> postBMI({required Map data}) async {
    try {
      var response =
          await aPiService.postWithBody(endpoint: '/BMI', data: data);
      return right(true);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromdioException(ex));
      } else {
        return left(ServerFailure(ex.toString()));
      }
    }
  }
}
