import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/create_group_cubit.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/select_group_screen.dart';
import 'package:family_gathering_v_0/screens/services/firebase_services.dart';
import 'package:family_gathering_v_0/views/group_view_item.dart';
import 'package:family_gathering_v_0/views/groups_view_list_view.dart';
import 'package:family_gathering_v_0/widgets/custom_elevated_button.dart';
import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class CreateGroupScreen extends StatefulWidget {
  static String id = "/create_group_screen";

  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  TextEditingController familyNamecontroller = TextEditingController();

  String? familyCode;

  bool isCodeGenerated = false;

  CreateGroupCubit createGroupCubit = CreateGroupCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupCubit, CreateGroupState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyTxtFormField(
                      controller: familyNamecontroller,
                      label: "اسم العيلة",
                      hint: " اكتب اسم العيلة",
                      maxLength: 20,
                      maxLines: 1,
                      onChanged: (val) {},
                      onSaved: (val) {},
                    ),
                    SizedBox(height: 20),

                    MyElevatedButton(
                      onPressed:
                          (isCodeGenerated == true)
                              ? null
                              : () async {
                                setState(() {});
                                if (familyNamecontroller.text.isEmpty) {
                                  showToastification(
                                    context: context,
                                    message:
                                        'هي عيلتك فاضية ولا إيه؟! أدخل اسم للعيلة أو التجمع يا عم',
                                  );
                                  return;
                                } else {
                                  familyCode = generateCode(6, existingCodes);
                                  isCodeGenerated = true;
                                  createGroupCubit.addNewFamilyGroup(
                                    familyNamecontroller.text,
                                  );
                                  FirebaseServices().getFamilyGroups();
                                  familyGroups.add(
                                    GroupViewItem(
                                      familyName: familyNamecontroller.text,
                                      color: generateRandomColor(),
                                    ),
                                  );
                                  showToastification(
                                    context: context,
                                    message: 'تم إنشاء رمز العيلة بنجاح',
                                  );
                                }
                              },
                      child: const Text("إصدار رمز العيلة"),
                    ),

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyText(text: familyCode ?? " "),
                        const SizedBox(width: 10),

                        (familyCode == null)
                            ? const Text(" ")
                            : IconButton(
                              icon: Icon(
                                Icons.copy,
                                color: Colors.black,
                                size: 20,
                              ),
                              onPressed:
                                  (familyCode == null)
                                      ? null
                                      : () {
                                        setState(() {});
                                        copyToClipboard(text: familyCode);
                                        showToastification(
                                          context: context,
                                          message:
                                              'تم نسخ رمز العيلة إلى الحافظة',
                                        );
                                      },
                            ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    (familyCode == null)
                        ? const Text(" ")
                        : MyElevatedButton(
                          child: const MyText(text: "إنشاء العيلة "),
                          onPressed: () {
                            navigateTo(context, SelectGroupScreen.id);
                          },
                        ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
