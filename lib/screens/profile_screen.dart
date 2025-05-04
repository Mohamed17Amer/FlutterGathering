import 'package:family_gathering_v_0/models/drop_down_txt_field_model.dart';
import 'package:family_gathering_v_0/views/drop_down_txt_field_item.dart';
import 'package:family_gathering_v_0/widgets/custom_elevated_button.dart';
import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<DropDownTextFieldItemModelModel> connectionWaysValuesList = [DropDownTextFieldItemModelModel()];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                   //   mainAxisSize: MainAxisSize.min, // important for scrolling
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
                  MyTxtFormField(
                    label: "اسمك",
                    keyboardType: TextInputType.name,
                    maxLength: 30,
                  ),
                  SizedBox(height: 10),
                  MyTxtFormField(
                    label: "رقم التليفون",
                    keyboardType: TextInputType.phone,
                    maxLength: 12,
                  ),
                  SizedBox(height: 10),
              
                  // For "محل الميلاد"
                  Row(
                    children: [
                      MyText(text: "محل الميلاد"),
                      SizedBox(width: 10),
                      Expanded(
                        // Use Expanded here inside Row to fill remaining space
                        child: MyTxtFormField(
                          label: "محل الميلاد",
                          keyboardType: TextInputType.text,
                          maxLength: 30,
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
                      Expanded(
                        // Use Expanded here too
                        child: MyTxtFormField(
                          label: "محل الإقامة",
                          keyboardType: TextInputType.text,
                          maxLength: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  MyElevatedButton(
                    child: MyText(text: "إضافة طرق الاتصال الأخرى"),
              
                    onPressed: () {
                      connectionWaysValuesList.add(
                        DropDownTextFieldItemModelModel(),
                      );
                      setState(() {}); // Call setState to refresh the UI
                    },
                  ),
                  SizedBox(
                    
                   height: 300,
                    child: ListView.builder(
                      itemCount:
                        connectionWaysValuesList.isEmpty ? 1 : connectionWaysValuesList.length,
                      itemBuilder: (context, index) {
                        return DropdownTextFieldsItem(index: index, items:connectionWaysValuesList,);
                      },
                    ),
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
