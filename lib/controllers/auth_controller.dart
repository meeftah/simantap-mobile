part of 'controllers.dart';

class AuthController extends GetxController {
  var isLoading = true.obs;
  var box = GetStorage();

  @override
  void onClose() {
    super.onClose();
  }

  void doRegister(dio.FormData formData) async {
    isLoading(true);
    try {
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
          snackbarSuccess(title: "Register Gagal", message: register.message);
        }
      } else {
        snackbarWarning(title: "Terjadi Kesalahan", message: register.message);
      }
    } finally {
      isLoading(false);
    }
  }
}
