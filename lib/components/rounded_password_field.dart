import 'package:flutter/material.dart';
import 'package:simantap/components/text_field_container.dart';
import 'package:simantap/res/theme.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool obscure;
  final Function onTap;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.onChanged,
    this.obscure = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscure,
        onChanged: onChanged,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              obscure ? Icons.visibility : Icons.visibility_off,
              color: primaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
