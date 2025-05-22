import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/create_group_screen.dart';
import 'package:flutter/material.dart';

class AddGroupItem extends StatelessWidget {
  const AddGroupItem({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, CreateGroupScreen.id);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 16.00,
        shadowColor: Colors.purple,
        color: Colors.amber,

        child: Container(
          height: 170,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: IconButton(
              icon: Icon(Icons.add_circle, color: Colors.black, size: 50),
              onPressed: () {
                navigateTo(context, CreateGroupScreen.id);
              },
            ),
          ),
        ),
      ),
    );
  }
}
