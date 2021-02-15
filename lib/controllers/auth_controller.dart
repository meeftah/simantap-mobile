part of 'controllers.dart';

class AuthController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  void doRegister(dio.FormData formData) async {
    Auth register = await ApiClient().apiRegister(formData);
    if (register.isNotNull) {
      box.write(boxEmail, register.data.email);
      box.write(boxApiToken, register.data.apiToken);

      Get.snackbar(
        "Register Berhasil",
        "email ${box.read(boxEmail)} dan token ${box.read(boxApiToken)}",
      );
    }
  }
}
