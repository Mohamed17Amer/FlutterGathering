import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/services/firebase_services.dart';
import 'package:flutter/material.dart';

import '../models/members_profile_model.dart';
import '../views/members_list_niew_item.dart';

class HomeScreen extends StatelessWidget {
  static final id = "/home_screen";
  FirebaseServices firebaseServices = FirebaseServices();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            MemberProfileModel memberModel = MemberProfileModel(
              name: FirebaseServices.groupUsersList[index]['name'],
              phone: FirebaseServices.groupUsersList[index]['phoneNumber'],
              img: FirebaseServices.groupUsersList[index]['imageUrl'],
              fromAddress:
                  FirebaseServices.groupUsersList[index]['fromAddress'],
              livingAddress:
                  FirebaseServices.groupUsersList[index]['livingAddress'],

              memberConnectionMap: FirebaseServices.groupUsersList[index]['memberConnectionMap'],
            );
            return MembersListNiewItem(memberModel: memberModel);
          },
          separatorBuilder:
              (context, index) =>
                  Divider(color: Colors.grey.shade100, thickness: 1.00),
          itemCount: FirebaseServices.groupUsersList.length,
        ),
      ),
    );
  }
}
