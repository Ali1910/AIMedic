import 'package:dio/dio.dart';
import 'package:gbsub/Core/services/faliure.dart';

Failure exceptionMethod(Object ex) {
  if (ex is DioException) {
    return ServerFailure.fromdioException(ex);
  } else {
    return ServerFailure(
      ex.toString(),
    );
  }
}
