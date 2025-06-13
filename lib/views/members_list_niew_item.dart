

import 'dart:developer';

import 'package:family_gathering_v_0/models/members_profile_model.dart';
import 'package:family_gathering_v_0/views/member_brief.dart';
import 'package:flutter/material.dart';

import 'member_connection_grid_view.dart' show MemberConnectionsGridView;

class MembersListNiewItem extends StatelessWidget {
  const MembersListNiewItem({super.key, required this.memberModel});
  final MemberProfileModel memberModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
      child: Column(children: [
        MemberBrief(memberModel: memberModel),
        SizedBox(
          height: 16,
        ),
        MemberConnectionsGridView( connectionWaysMap: memberModel.memberConnectionMap?? {},),
      ]), 
    );
  }
}
