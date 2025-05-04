import 'package:family_gathering_v_0/views/drop_down_txt_field_item.dart';
import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding( // optional, for better padding
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min, // important for scrolling
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/sms.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  MyTxtFormField(label: "اسمك", keyboardType: TextInputType.name, maxLength: 30,
                  ),
                  SizedBox(height: 10),
                  MyTxtFormField(
                    label: "رقم التليفون",
                    keyboardType: TextInputType.phone,maxLength: 12,
                  ),
                  SizedBox(height: 10),
      
                  // For "محل الميلاد"
                  Row(
                    children: [
                      MyText(text: "محل الميلاد"),
                      SizedBox(width: 10),
                      Expanded( // Use Expanded here inside Row to fill remaining space
                        child: MyTxtFormField(
                          label: "محل الميلاد",
                          keyboardType: TextInputType.text, maxLength: 30
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
      
                  // For "محل الإقامة"
                  Row(
                    children: [
                      MyText(text: "محل الإقامة"),
                      SizedBox(width: 10),
                      Expanded( // Use Expanded here too
                        child: MyTxtFormField(
                          label: "محل الإقامة",
                          keyboardType: TextInputType.text, maxLength: 30
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 500,
                    child: DropdownTextFieldsItem(optionsList: [  "القرية",
                      "المدينة",
                      "المحافظة",
                      "الدولة",]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}