import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class MySvg extends StatelessWidget {
  const MySvg(
      {super.key,
      required this.svgImgPath,
      this.svgImgSize,
      this.svgCircleAvatarRadius});

  final String svgImgPath;
  final Size? svgImgSize;
  final double? svgCircleAvatarRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius:28,
      
      child: CircleAvatar(
        radius: svgCircleAvatarRadius ?? 30,
        backgroundImage: Svg(
          svgImgPath,
         size: svgImgSize ?? Size(24, 24),
        ),
      ),
    );
  }
}
