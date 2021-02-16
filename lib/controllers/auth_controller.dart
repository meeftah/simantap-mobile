part of 'controllers.dart';

class AuthController extends GetxController {
  final box = GetStorage();

  @override
  void onClose() {
    super.onClose();
  }

  void doRegister(dio.FormData formData) async {
    Auth register = await ApiClient().apiRegister(formData);
    if (register.isNotNull) {
      if (register.status) {
        box.write(boxEmail, register.data.email);
        box.write(boxApiToken, register.data.apiToken);
        box.write(boxIsLoggedIn, true);

        Get.snackbar(
          "Register Berhasil",
          "email ${box.read(boxEmail)} dan token ${box.read(boxApiToken)}",
        );
      } else {
        Get.snackbar(
          "Register Gagal",
          "${register.message}",
          margin: EdgeInsets.all(20.0),
          colorText: Colors.white,
          backgroundColor: Colors.yellow[800],
        );
      }
    } else {
      Get.snackbar(
          "Terjadi Kesalahan",
          "${register.message}",
          margin: EdgeInsets.all(20.0),
          colorText: Colors.white,
          backgroundColor: Colors.yellow[800],
        );
    }
  }
}
