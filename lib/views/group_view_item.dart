import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/models/group_model.dart';
import 'package:family_gathering_v_0/screens/sign_in_screen.dart';
import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:flutter/material.dart';

class GroupViewItem extends StatefulWidget {
  GroupViewItem({super.key, this.color, this.familyGroupMap, this.currentUserId});
  Color? color = Colors.purple;
  QueryDocumentSnapshot<Map<String, dynamic>>? familyGroupMap;
  int? currentUserId;

  @override
  State<GroupViewItem> createState() => _GroupViewItemState();
}

class _GroupViewItemState extends State<GroupViewItem> {
 late GroupModel groupModel;
  @override
  void initState() {
    super.initState();
    groupModel = GroupModel(
      id: widget.familyGroupMap!['id']!,
      name: widget.familyGroupMap!['name']!,
      code: widget.familyGroupMap!['code']!,
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen(groupModel: groupModel,)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 16.00,
        shadowColor: Colors.purple,
        color: widget.color,

        child: Container(
          height: 170,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(color: widget.color!, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: MyText(text: widget.familyGroupMap!['name'])),
        ),
      ),
    );
  }
}
