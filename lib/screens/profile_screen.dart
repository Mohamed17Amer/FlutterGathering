import 'package:family_gathering_v_0/cubits/cubit/cubit/profile_cubit.dart';
import 'package:family_gathering_v_0/views/connection_ways_drop_down_view.dart';
import 'package:family_gathering_v_0/widgets/custom_elevated_button.dart';
import 'package:family_gathering_v_0/widgets/custom_svg_img.dart';
import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  static String id = "/profile_screen";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileCubit profileCubit = ProfileCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getCurrentUserData(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
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
                                child: MySvg(
                                  svgImgPath: ProfileCubit.currentUser!.img!,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        MyTxtFormField(
                          controller: ProfileCubit.nameController,
                          label: 
                               ProfileCubit.nameController.text,
                          hint: "الاسم بالكامل",

                          keyboardType: TextInputType.name,
                          maxLength: 30,
                        ),
                        SizedBox(height: 10),
                        MyTxtFormField(
                          controller: ProfileCubit.phoneNumberController,
                          label: ProfileCubit.phoneNumberController.text,
                          hint: "رقم التليفون",
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
                                controller: ProfileCubit.fromAddressController,
                                label:  ProfileCubit.fromAddressController.text,
                                hint:" اتولدت فين",
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
                              child: MyTxtFormField(
                                controller:
                                    ProfileCubit.livingAddressController,
                                label:
                                   ProfileCubit.livingAddressController.text,
                                hint: "بتعيش فين",
                                keyboardType: TextInputType.text,
                                maxLength: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        MyElevatedButton(
                          onPressed: null,
                          child: MyText(text: "إضافة طرق الاتصال الأخرى"),
                        ),
                        SizedBox(
                          height: 400,
                          child: ConnectionWaysDropDownView(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  await profileCubit.assignProfileData();
                },
                elevation: 20,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                focusColor: Colors.blue,
                child: Icon(Icons.save),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ****************************
