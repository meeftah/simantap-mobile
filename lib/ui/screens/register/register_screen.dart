part of 'package:simantap/ui/screens/screens.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;

  void _togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
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
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    icon: Icons.email,
                    hintText: "Email Anda",
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    hintText: "Password Anda",
                    obscure: _obscurePassword,
                    onTap: () => _togglePassword(),
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    hintText: "Konfirmasi Password Anda",
                    obscure: _obscurePassword,
                    onTap: () => _togglePassword(),
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                    text: "DAFTAR",
                    press: () {},
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
        ),
      ),
    );
  }
}
