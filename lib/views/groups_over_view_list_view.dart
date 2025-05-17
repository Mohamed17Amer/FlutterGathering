import 'package:family_gathering_v_0/views/group_over_view_item.dart';
import 'package:flutter/material.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (index, context) {
        return GroupViewItem(color: Colors.purple);
      },
      itemCount: 7,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        childAspectRatio: 1, // Width to height ratio
        crossAxisSpacing: 8, // Space between columns
        mainAxisSpacing: 8, // Space between rows
        
      ),
      scrollDirection: Axis.vertical,

      shrinkWrap: true, // Allow the grid to take only the space it needs
    );
  }
}
