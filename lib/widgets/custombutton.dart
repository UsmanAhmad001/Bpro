import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Widget? widget;
  final String text;
  final Color color;
  final double fontSize;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final double borderRadius;
  final Color border;
  final Function() onPressed;

  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      this.widget,
      required this.text,
      required this.color,
      this.fontSize = 14,
      required this.backgroundColor,
      required this.fontWeight,
      required this.borderRadius,
      required this.border,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: border,),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget != null) widget!,
            if (widget != null) const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                  color: color, fontSize: fontSize, fontWeight: fontWeight),
            )
          ],
        ),
      ),
    );
  }
}
