
import 'package:family_gathering_v_0/models/member_conniction_way_model.dart';
import 'package:family_gathering_v_0/widgets/custom_svg_img.dart';
import 'package:flutter/material.dart';

class MemberConnectionsGridViewItem extends StatelessWidget {
  final MemberConnectionWayModel memberConnectionWayModel;
  const MemberConnectionsGridViewItem({super.key, required this.memberConnectionWayModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: memberConnectionWayModel.onConnectionWayPressed,
      child: MySvg(
        svgImgPath: memberConnectionWayModel.connectionImgPath,
      ),
    );
  }
}
