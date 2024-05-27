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

  Future<dynamic> postNoBody({required String endpoint}) async {
    var response = await _dio.post(
      '$baseUrl$endpoint',
    );
    return response;
  }

  Future<dynamic> postWithBody(
      {required String endpoint, required dynamic data}) async {
    var response = await _dio.post('$baseUrl$endpoint', data: data);
    return response;
  }
}
