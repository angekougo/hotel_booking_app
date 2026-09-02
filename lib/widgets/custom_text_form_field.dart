import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.hintText,
      this.prefixIcon,
      this.prefixIconColor,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: prefixIconColor,) : null,
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
