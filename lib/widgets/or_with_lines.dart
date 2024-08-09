import 'package:flutter/material.dart';

class OrWithLines extends StatelessWidget {
  final double marginVertical;
  final double thicknessLine;
  final Color lineColor;
  final String textOr;
  final double fontSize;
  final double textPadding;
  final FontWeight fontWeight;

  const OrWithLines(
      {super.key,
      required this.marginVertical,
      required this.thicknessLine,
      required this.lineColor,
      required this.textOr,
      required this.fontSize,
      required this.textPadding, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginVertical),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              thickness: thicknessLine,
              color: lineColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: textPadding),
            child: Text(
              textOr,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: thicknessLine,
              color: lineColor,
            ),
          ),
        ],
      ),
    );
  }
}
