import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Color backgroundColor;
  final Color borderColor;
  final Color placeholderColor;
  final Color textColor;

  CustomTextField({
    required this.controller,
    required this.placeholder,
    this.backgroundColor = const Color(0xFF242424),
    this.borderColor = const Color(0xFF959A9A),
    this.placeholderColor = const Color(0xFF959A9A),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      style: TextStyle(color: textColor, fontSize: 16),
      placeholder: placeholder,
      placeholderStyle: TextStyle(fontSize: 14, color: placeholderColor),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: borderColor,
        ),
      ),
    );
  }
}
