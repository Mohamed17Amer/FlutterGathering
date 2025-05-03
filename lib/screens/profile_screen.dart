import 'package:family_gathering_v_0/models/address_model.dart';
import 'package:family_gathering_v_0/models/members_profile_model.dart';
import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
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

              MyTxtFormField(label: "اسمك", keyboardType: TextInputType.name),
              SizedBox(height: 10),
              MyTxtFormField(
                label: "رقم التليفون",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: "محل الميلاد"),
                  MyTxtFormField(
                    label: "محل الميلاد",
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: "محل الإقامة"),
                  MyTxtFormField(
                    label: "محل الإقامة",
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
