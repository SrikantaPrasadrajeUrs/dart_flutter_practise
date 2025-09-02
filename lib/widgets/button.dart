import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color? borderColor;
  final String? text;
  final String? imagePath;
  final double width;
  final double height;
  final TextStyle textStyle;
  final VoidCallback? onPressed; // void function(){}

  const Button({
    super.key,
    this.borderColor,
    this.imagePath,
    required this.backgroundColor,
    required this.textStyle,
    this.onPressed,
    this.text,
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
          border: Border.all(color: borderColor??Colors.indigoAccent)
        ),
        child: Center(child: text!=null?Text(text!, style: textStyle,):Image.asset(imagePath!, width: 25, height: 25,)),
      ),
    );
  }
}
