import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        } else if (hintText == 'Email') {
          bool emailValidation = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(val);
          if (!emailValidation) {
            return 'Incorrect email address';
          }
        } else if (hintText == 'Image') {
          bool imageValidation =
              RegExp(r"(https?|http)://[a-zA-Z0-9]").hasMatch(val);
          if (!imageValidation) {
            return 'Incorrect image link';
          }
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
