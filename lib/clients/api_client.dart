import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:simantap/clients/logging_interceptor.dart';
import 'package:simantap/models/auth.dart';
import 'package:simantap/res/constants.dart';

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
    if (response.statusCode == 200) {
      return authFromJson(response.data);
    } else {
      return Auth.fromJson(jsonDecode(response.data));
    }
  }

  // Dio Error Handler
  String handleError(DioError dioError) {
    String errorDescription = "";
    switch (dioError.type) {
      case DioErrorType.CANCEL:
        errorDescription = cancelled;
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = timeOut;
        break;
      case DioErrorType.DEFAULT:
        errorDescription = defaultErrorMessage;
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = timeOut;
        break;
      case DioErrorType.RESPONSE:
        errorDescription = failedStatusCode + '${dioError.response.statusCode}';
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = sendTimeOut;
        break;
      default:
        errorDescription = defaultErrorMessage;
        break;
    }

    return errorDescription;
  }
}
