import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key, required this.text, this.fontSize, this.color, this.maxLines});
  final String? text;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      maxLines: maxLines ?? 1,
      style: TextStyle(
        fontSize: fontSize ?? 18,
        color: color,
        
      
      ),
      
    );
  }
}
