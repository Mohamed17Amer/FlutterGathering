import 'package:family_gathering/models/members_profile_model.dart';

import 'package:family_gathering/views/contacts_grid_view.dart';
import 'package:family_gathering/views/member_brief.dart';

import 'package:flutter/material.dart';

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
        ConnectionsGridView(),
      ]),
    );
  }
}
