import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:flutter/material.dart';

class MyTxtButton extends StatelessWidget {
  const MyTxtButton({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.onPressed,
    this.text,
    this.fontSize,
    this.fontColor,  this.isEnabled,
  });

  final double? height;
  final double? width;
  final double? padding;
  final Function()? onPressed;

  final String? text;
  final double? fontSize;
  final Color? fontColor;

  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: ElevatedButton(
        
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: padding ?? 4.0, vertical: 2),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.white),
          fixedSize: WidgetStateProperty.all(Size(width ?? 280, height ?? 50)),
        ),

        onPressed: onPressed,
        child: MyText(text: text, fontSize: fontSize, color: fontColor),
        
      ),
    );
  }
}
