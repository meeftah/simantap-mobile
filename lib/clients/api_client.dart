import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simantap/clients/logging_interceptor.dart';
import 'package:simantap/models/auth.dart';
import 'package:simantap/models/info_tambahan.dart';
import 'package:simantap/res/constants.dart';

class ApiClient {
  // static final endpoint = "http://192.168.100.95:8000/";
  // static final endpoint = "http://10.10.8.38:8000/";
  static final endpoint = "http://testapp.alfityankuburaya.sch.id/";
  static final version1 = "api/v1/";
  static final register = endpoint + version1 + "register";
  static final login = endpoint + version1 + "login";
  static final modul2 = endpoint + version1 + "modul2";

  Dio dio;

  final box = GetStorage();

  ApiClient() {
    BaseOptions options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
    );
    dio = Dio(options);
    dio.interceptors.add(LoggingInterceptor());
  }

  // ---------------- Register
  Future<Auth> apiRegister(FormData formData) async {
    try {
      Response response = await dio.post(register, data: formData);
      return authFromJson(response.data);
    } catch (error) {
      return Auth.withError(handleError(error));
    }
  }

  // ---------------- Register
  Future<Auth> apiLogin(FormData formData) async {
    try {
      Response response = await dio.post(login, data: formData);
      return authFromJson(response.data);
    } catch (error) {
      return Auth.withError(handleError(error));
    }
  }

  // ---------------- Info Tambahan
  Future<InfoTambahan> apiInfoTambahan() async {
    try {
      String token = box.read(boxApiToken);
      String email = box.read(boxEmail);
      
      dio.options.headers["authorization"] = "Bearer $token";
      dio.options.headers["email"] = email;

      Response response = await dio.get(modul2);
      return infoTambahanFromJson(response.data);
    } catch (error) {
      return InfoTambahan.withError(handleError(error));
    }
  }

  // ################ Dio Error Handler
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
