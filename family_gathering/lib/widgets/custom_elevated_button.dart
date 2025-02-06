import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton(
      {super.key,
      this.height,
      this.width,
      this.padding,
      this.child,
      this.onPressed});

  final double? height;
  final double? width;
  final double? padding;
  final Widget? child;
  final Function()? onPressed;

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
          fixedSize: WidgetStateProperty.all(
            Size(
              width ?? 280,
              height ?? 50,
            ),
          ),
          
        ),
    
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
