import 'package:dio/dio.dart';
import 'package:gbsub/Core/utilts/constans.dart';

class APiService {
  final Dio _dio;
  APiService(this._dio);

  Future<dynamic> get({required String endpoint}) async {
    var response = await _dio.get(
      '$baseUrl$endpoint',
    );
    return response;
  }
}
