import 'package:family_gathering_v_0/cubits/cubit/cubit/profile_cubit.dart';
import 'package:family_gathering_v_0/models/drop_down_txt_field_model.dart';
import 'package:family_gathering_v_0/models/members_profile_model.dart';
import 'package:family_gathering_v_0/views/drop_down_txt_field_item.dart';
import 'package:family_gathering_v_0/widgets/custom_elevated_button.dart';
import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static String id = "/profile_screen";
  ProfileCubit profileCubit = ProfileCubit(MemberProfileModel());

  List<DropDownTextFieldItemModelModel> connectionWaysValuesList = [
    DropDownTextFieldItemModelModel(),
  ];

  ProfileScreen({super.key});

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
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            profileCubit.pickImage();
                          },
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                profileCubit.member!.img ??
                                    "assets/images/sms.png",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  MyTxtFormField(
                    controller: profileCubit.nameController,
                    label: profileCubit.member!.name ?? "اسمك",
                    keyboardType: TextInputType.name,
                    maxLength: 30,
                    onSaved: profileCubit.setMemberName(
                      profileCubit.nameController.text,
                    ),
                  ),
                  SizedBox(height: 10),
                  MyTxtFormField(
                    controller: profileCubit.phoneNumberController,
                    label: profileCubit.member!.phone ?? "رقم التليفون",
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
                          controller: profileCubit.fromAddressController,
                          //   label: profileCubit.member!.fromAddress?.detaledAddress?? "محل الميلاد",
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
                          controller: profileCubit.livingAddressController,
                          // label:profileCubit.member!.livingAddress?.detaledAddress?? "محل الإقامة",
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
                    },
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount:
                          connectionWaysValuesList.isEmpty
                              ? 1
                              : connectionWaysValuesList.length,
                      itemBuilder: (context, index) {
                        return DropdownTextFieldsItem(
                          index: index,
                          items: connectionWaysValuesList,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            profileCubit.assignProfileData();
            Navigator.pop(context);
          },
          child: Icon(Icons.save),
          elevation: 20,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          focusColor: Colors.blue,
        ),
      ),
    );
  }
}
