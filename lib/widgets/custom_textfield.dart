import 'package:bpro/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  required String hintText,
  Widget? prefixIcon,
  String? errorText,
  TextStyle? hintStyle,
  Color bordercolor=Colors.grey,
  Color focusedBorderColor=const Color.fromARGB(255, 177, 169, 156),
  Color cursorColor=AppColors.appPrimaryColor,
  Color backgroundColor=AppColors.transparent,

  IconData? suffixIcon,
  bool isPassword = false,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
  int maxLines = 1,
  int minLines = 1,
}) {
  return TextFormField(
    cursorColor: cursorColor,
    validator: validator,
    controller: controller,
    obscureText: isPassword,
    keyboardType: keyboardType,
    onChanged: onChanged,
    maxLines: maxLines,
    decoration: InputDecoration(
      errorText: errorText,
      filled: true,
      fillColor: backgroundColor,
      hintText: hintText,
      hintStyle: hintStyle,
      prefixIcon: prefixIcon ,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: focusedBorderColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: bordercolor, width: 1),
      ),
    ),
    minLines: minLines,
  );
}
