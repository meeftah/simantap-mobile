part of 'controllers.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfController = TextEditingController();

  final box = GetStorage();

  @override
  void onClose() {
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    passwordConfController?.dispose();
    super.onClose();
  }

  void doRegister() async {
    dio.FormData formData = dio.FormData.fromMap({
      formName: nameController.text.trim(),
      formEmail: emailController.text.trim(),
      formPassword: passwordController.text.trim(),
      formPassConf: passwordConfController.text.trim(),
    });
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
      }
    }
  }

  // Sign out
  void doLogOut() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfController.clear();
  }
}
