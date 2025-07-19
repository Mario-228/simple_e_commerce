import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/app_fonts/app_fonts.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.color,
    this.onPressed,
    this.textColor,
    this.height = 50.0,
  });
  final String text;
  final Color color;
  final void Function()? onPressed;
  final Color? textColor;
  final double height;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      minWidth: double.infinity,
      onPressed: onPressed,
      color: color,
      height: height,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      child: Text(
        text,
        style: AppFonts.textStyleBold16.copyWith(color: textColor),
      ),
    );
  }
}
