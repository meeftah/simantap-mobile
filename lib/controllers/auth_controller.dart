part of 'controllers.dart';

class AuthController extends GetxController {
  final box = GetStorage();

  @override
  void onClose() {
    super.onClose();
  }

  void doRegister(BuildContext context, dio.FormData formData) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(
      context,
      blur: 10,
      dismissable: false,
    );
    try {
      progressDialog.show();
      Auth response = await ApiClient().apiRegister(formData);
      progressDialog.dismiss();
      if (response.isNotNull) {
        if (response.status) {
          box.write(boxName, response.data.name);
          box.write(boxEmail, response.data.email);
          box.write(boxApiToken, response.data.apiToken);
          box.write(boxIsLoggedIn, true);

          Get.offAll(HomeScreen());
        } else {
          snackbarWarning(title: "Register Gagal", message: response.message);
        }
      } else {
        snackbarWarning(title: "Terjadi Kesalahan", message: response.message);
      }
    } catch (e) {
      print("Register > Error: " + e);
    }
  }

  void doLogin(BuildContext context, dio.FormData formData) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(
      context,
      blur: 10,
      dismissable: false,
    );
    try {
      progressDialog.show();
      Auth response = await ApiClient().apiLogin(formData);
      progressDialog.dismiss();
      if (response.isNotNull) {
        if (response.status) {
          box.write(boxName, response.data.name);
          box.write(boxEmail, response.data.email);
          box.write(boxApiToken, response.data.apiToken);
          box.write(boxIsLoggedIn, true);

          Get.offAll(HomeScreen());
        } else {
          snackbarWarning(title: "Login Gagal", message: response.message);
        }
      } else {
        snackbarWarning(title: "Terjadi Kesalahan", message: response.message);
      }
    } catch (e) {
      print("Login > Error: " + e);
    }
  }
}
