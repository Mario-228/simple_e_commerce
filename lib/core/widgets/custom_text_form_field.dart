import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/app_colors/app_colors.dart';
import 'package:simple_e_commerce/core/utils/app_fonts/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.type,
    required this.labelText,
    required this.controller,
    this.validator,
    this.icon,
    this.onPressed,
    this.isPassword = false,
    this.readOnly = false,
  });
  final TextInputType type;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? icon;
  final void Function()? onPressed;
  final bool isPassword;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      obscureText: isPassword,
      keyboardType: type,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        labelText: labelText,
        labelStyle: AppFonts.textStyleLight13.copyWith(
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon)),
      ),
      controller: controller,
      validator: validator,
    );
  }
}
