
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/members_profile_model.dart';
import '../views/members_list_niew_item.dart';

class HomeScreen extends StatelessWidget {
    static final  id = "/home_screen";
    

  const HomeScreen({super.key,QueryDocumentSnapshot? familyGroupMap});

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