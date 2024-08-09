import 'package:flutter/material.dart';
import 'package:linkedin_slicing/widgets/colors.dart';

class MyCheckbox extends StatefulWidget {
  final double height;
  final double width;
  final double marginLeft;
  final double fontSize;
  final String text;
  final Color checkBoxColor;
  final bool value;
  final void Function(bool?) onChanged;

  const MyCheckbox(
      {super.key,
      required this.height,
      required this.width,
      required this.marginLeft,
      required this.fontSize,
      required this.text,
      required this.onChanged,
      required this.checkBoxColor,
      required this.value});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: Checkbox(
            value: widget.value,
            activeColor: widget.checkBoxColor,
            onChanged: widget.onChanged,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
              ),
            )),
      ],
    );
  }
}
