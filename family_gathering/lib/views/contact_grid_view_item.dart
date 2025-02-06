import 'package:family_gathering/models/contact_way_model.dart';
import 'package:family_gathering/widgets/custom_svg_img.dart';
import 'package:flutter/material.dart';

class ConnectionsGridViewItem extends StatelessWidget {
  final ConnectionWayModel connectionWayModel;
  const ConnectionsGridViewItem({super.key, required this.connectionWayModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: connectionWayModel.onContactWayPressed,
      child: MySvg(
        svgImgPath: connectionWayModel.contactImgPath,
      ),
    );
  }
}
