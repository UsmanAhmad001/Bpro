import 'package:flutter/material.dart';

// Extension on BuildContext
extension ContextSizeExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double heightPercentage(double percentage) =>
      MediaQuery.of(this).size.height * percentage;

  double widthPercentage(double percentage) =>
      MediaQuery.of(this).size.width * percentage;
}
