import 'package:flutter/material.dart';

class ContinueButton extends StatefulWidget {
  final String textButton;
  final Color backgroundColor;
  final double padding;
  final double fontSize;
  final Color textColor;
  final VoidCallback onPressed;

  const ContinueButton(
      {super.key,
      required this.textButton,
      required this.backgroundColor,
      required this.padding,
      required this.fontSize,
      required this.textColor,
      required this.onPressed});

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        padding: EdgeInsets.all(widget.padding),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.textButton,
        style: TextStyle(fontSize: widget.fontSize, color: Colors.white),
      ),
    );
  }
}
