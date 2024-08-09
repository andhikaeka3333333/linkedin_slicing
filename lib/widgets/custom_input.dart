import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final Color cursorColor;
  final Color labelColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;

  const CustomInput(
      {super.key,
      required this.labelText,
      required this.keyboardType,
      required this.obscureText,
      this.onChanged,
      required this.isPassword,
      required this.cursorColor,
      required this.labelColor,
      required this.enabledBorderColor,
      required this.focusedBorderColor});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? _isObsecure : widget.obscureText,
      cursorColor: widget.cursorColor,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: widget.labelColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.enabledBorderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.focusedBorderColor, width: 2),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon:
                    Icon(_isObsecure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObsecure = !_isObsecure;
                  });
                },
              )
            : null,
      ),
      onChanged: widget.onChanged,
    );
  }
}
