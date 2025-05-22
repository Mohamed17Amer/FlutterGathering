import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/sign_in_screen.dart';
import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:flutter/material.dart';

class GroupViewItem extends StatelessWidget {
  GroupViewItem({super.key, this.color, this.familyName, });
  Color? color=Colors.purple;
  String? familyName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(context, SignInScreen.id);

      },
      child: Card(
      
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 16.00,
        shadowColor: Colors.purple,
        color: color,
      
        child: Container(
          height: 170,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(color: color!, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child:MyText(text: familyName!)
          )
        ),
      ),
    );
  }
}
