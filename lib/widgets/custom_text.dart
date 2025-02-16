import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration decoration; // Add decoration parameter

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    required this.color,
    this.decoration = TextDecoration.none, // Default to no decoration
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle(fontSize, fontWeight, color, decoration), // Pass decoration here
    );
  }
}

TextStyle textStyle(double fontSize, FontWeight fontWeight, Color color, TextDecoration decoration) {
  return TextStyle(
    fontSize: fontSize,
    decoration: decoration,  // Apply the passed decoration
    color: color,
    fontFamily: "OpenSans",
    fontWeight: fontWeight,
  );
}
