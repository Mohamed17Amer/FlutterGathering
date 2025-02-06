import 'package:family_gathering/models/members_profile_model.dart';
import 'package:family_gathering/views/members_list_niew_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) => MembersListNiewItem(memberModel: MemberProfileModel(),),
          separatorBuilder: (context, index) => Divider( color: Colors.grey.shade100,thickness: 1.00,),
          itemCount: 10,
        )
      ),
    );
  }
}