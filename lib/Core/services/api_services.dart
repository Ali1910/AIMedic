import 'package:dio/dio.dart';
import 'package:gbsub/Core/utilts/constans.dart';

class APiService {
  final Dio dio;

  APiService(this.dio);

  Future<dynamic> get({required String endpoint}) async {
    dio.options.connectTimeout = const Duration(seconds: 30);

    var response = await dio.get(
      '$baseUrl$endpoint',
    );

    return response;
  }

  Future<dynamic> postNoBody({required String endpoint}) async {
    var response = await dio.post(
      '$baseUrl$endpoint',
    );
    return response;
  }

  Future<dynamic> postWithBody(
      {required String endpoint, required dynamic data}) async {
    var response = await dio.post('$baseUrl$endpoint', data: data);
    return response;
  }

  Future<dynamic> delete({required String endpoint}) async {
    var response = await dio.delete('$baseUrl$endpoint');
    return response;
  }
}
