import 'package:dio/dio.dart';
import 'package:simantap/clients/logging_interceptor.dart';
import 'package:simantap/models/auth.dart';

class ApiClient {
  static final endpoint = "http://192.168.100.95:8000/";
  static final version1 = "api/v1/";
  static final register = endpoint + version1 + "register";
  static final login = endpoint + version1 + "login";

  Dio dio;

  ApiClient() {
    BaseOptions options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
    );
    dio = Dio(options);
    dio.interceptors.add(LoggingInterceptor());
  }

  // ---------------- Login
  Future<Auth> apiRegister(FormData formData) async {
    Response response = await dio.post(register, data: formData);
    return response.statusCode == 200 ? authFromJson(response.data) : null;
  }
}
