import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String firstText;
  final String secondText;
  final Color firstTextColor;
  final Color secondTextColor;
  final FontWeight fontWeight;
  final double fontSize;

  const NavigateButton(
      {super.key,
      required this.onPressed,
      required this.firstText,
      required this.secondText,
      required this.firstTextColor,
      required this.secondTextColor,
      required this.fontWeight,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
        child: Row(
          children: [
            Text(
              firstText,
              style: TextStyle(
                color: firstTextColor,
                fontSize: fontSize,
              ),
            ),
            Text(
              secondText,
              style: TextStyle(
                  color: secondTextColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
            )
          ],
        ));
  }
}
