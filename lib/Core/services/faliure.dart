import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromdioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('تاكد من الاتصال من الانترنت');
      case DioExceptionType.sendTimeout:
        return ServerFailure('فشل الأرسال تاكد من الاتصال من الانترنت');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('تاكد من الاتصال من الانترنت');
      case DioExceptionType.badCertificate:
        return ServerFailure('errMessage');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data!);
      case DioExceptionType.cancel:
        return ServerFailure('errMessage');
      case DioExceptionType.connectionError:
        return ServerFailure('لا يوجد اتصال بالأنترنت');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('لا يوجد اتصال بالأنترنت');
        } else {
          return ServerFailure('حاول مرة اخرى');
        }
      default:
        return ServerFailure('errMessage');
    }
  }

  factory ServerFailure.fromResponse(int statesCode, dynamic response) {
    if (statesCode == 400) {
      if (response.runtimeType == String) {
        return ServerFailure(response);
      } else {
        return response['Name'][0];
      }
    } else {
      return ServerFailure('يوجد مشكلة في الخادم يتم العمل عليه حاليا');
    }
  }
}
