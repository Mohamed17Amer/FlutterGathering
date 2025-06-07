import 'package:family_gathering_v_0/cubits/cubit/cubit/create_group_cubit.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/services/firebase_services.dart';
import 'package:family_gathering_v_0/views/add_group_item.dart';
import 'package:family_gathering_v_0/views/group_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GroupsView extends StatefulWidget {
   GroupsView({super.key, this.currentUserId});

int? currentUserId;
  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupCubit, CreateGroupState>(
      builder: (context, state) {
        return   GridView.builder(
          itemBuilder: (context, index) {
            if (FirebaseServices.familyGroupsList.isEmpty) {
              return AddGroupItem();
            } else {
              if (index == 0) {
                return AddGroupItem();
              } else {
                return GroupViewItem(
                  familyGroupMap:
                      FirebaseServices.familyGroupsList[index-1],
                       currentUserId: widget.currentUserId,
                  color: generateRandomColor(),
                );
              }
            }
          },
          itemCount:(FirebaseServices.familyGroupsList.isEmpty)?1: FirebaseServices.familyGroupsList.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 1, // Width to height ratio
            crossAxisSpacing: 8, // Space between columns
            mainAxisSpacing: 8, // Space between rows
          ),
          scrollDirection: Axis.vertical,

          //  shrinkWrap: true, // Allow the grid to take only the space it needs
        );
      },
    );
  }
}
