import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final double width;
  final double height;
  final TextStyle textStyle;
  final VoidCallback? onPressed; // void function(){}
  const Button({super.key,
    required this.backgroundColor,
    required this.textStyle,
    this.onPressed,
    required this.text,
    this.width = 150,
    this.height = 50});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          border: Border.all(color: Colors.indigoAccent)
        ),
        child: Center(child: Text(text, style: textStyle,)),
      ),
    );
  }
}
