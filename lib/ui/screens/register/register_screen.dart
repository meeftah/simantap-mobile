part of 'package:simantap/ui/screens/screens.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _name;
  String _email;
  String _password;
  String _passwordConfirmation;

  bool _obscurePassword = true;
  bool _obscureKonfirmasiPassword = true;

  void _togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleKonfirmasiPassword() {
    setState(() {
      _obscureKonfirmasiPassword = !_obscureKonfirmasiPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: GetX<AuthController>(
          init: AuthController(),
          initState: (_) {},
          builder: (controller) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/register/images/signup_top.png",
                    width: size.width * 0.35,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/common/images/main_bottom.png",
                    width: size.width * 0.25,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "SI MANTAP",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "DAFTAR",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Image.asset(
                        "assets/register/icons/register.png",
                        height: size.height * 0.20,
                      ),
                      RoundedInputField(
                        icon: Icons.tag_faces,
                        hintText: "Nama Anda",
                        onChanged: (value) => _name = value,
                      ),
                      RoundedInputField(
                        icon: Icons.email,
                        hintText: "Email Anda",
                        onChanged: (value) => _email = value,
                      ),
                      RoundedPasswordField(
                        hintText: "Password Anda",
                        obscure: _obscurePassword,
                        onTap: () => _togglePassword(),
                        onChanged: (value) => _password = value,
                      ),
                      RoundedPasswordField(
                        hintText: "Konfirmasi Password Anda",
                        obscure: _obscureKonfirmasiPassword,
                        onTap: () => _toggleKonfirmasiPassword(),
                        onChanged: (value) => _passwordConfirmation = value,
                      ),
                      RoundedButton(
                        text: "DAFTAR",
                        press: () {
                          dio.FormData formData = dio.FormData.fromMap({
                            formName: _name,
                            formEmail: _email,
                            formPassword: _password,
                            formPassConf: _passwordConfirmation,
                          });
                          controller.doRegister(formData);
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Sudah mempunyai akun? Silakan ",
                            style: TextStyle(color: primaryColor),
                          ),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Text(
                              "Masuk di sini",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
