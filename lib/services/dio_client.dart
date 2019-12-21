import 'package:dio/dio.dart';

class DioClient {
  Dio dio = new Dio();

  Future<dynamic> getAsync(String endPoint) async {
    try {
      Response response = await dio.get(endPoint);
      print(response);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> postAsync(String endPoint, Map data) async {
    try {
      Response response = await dio.post(endPoint, data: data);
      print(response);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> putAsync(String endPoint, Map data) async {
    try {
      Response response = await dio.put(endPoint, data: data);
      print(response);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
