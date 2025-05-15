import 'package:family_gathering_v_0/cubits/cubit/cubit/phone_number_cubit.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/register_cubit.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/sign_in_screen.dart';
import 'package:family_gathering_v_0/views/country_picker.dart';
import 'package:family_gathering_v_0/widgets/custom_elevated_button.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_txt.dart';

class SignUpScreen extends StatelessWidget {
  static final id = "/sign_up_screen";

  SignUpScreen({super.key});

  GlobalKey signUpFormKey = GlobalKey<FormState>();
  PhoneNumberCubit phoneNumberCubit = PhoneNumberCubit();
  RegisterCubit registerCubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyElevatedButton(
                    width: 320,
                    child: MyText(
                      text: " يلا نسجل البيانات يا جميل  ",
                      fontSize: 30,
                      color: Colors.purple,
                    ),
                  ),
                  MyText(
                    text: "اكتب تليفونك تحت يا عسل ",
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  CountryPicker(),
                  BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
                    builder: (context, state) {
                      return MyTxtFormField(
                        controller: phoneNumberCubit.phonenNumberContoller,

                        maxLength: 10,
                        onChanged: (val) {
                          context.read<PhoneNumberCubit>().validateTyping(
                            phoneNumberCubit.phonenNumberContoller.text,
                          );
                        },
                        onValidate: (val) {
                          phoneNumberCubit.validateTyping(
                            phoneNumberCubit.phonenNumberContoller.text,
                          );
                        },

                        keyboardType: TextInputType.phone,
                      );
                    },
                  ),

                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return ExpansionTile(
                        controller: registerCubit.otpExpansionController,
                        enabled: false,
                        title: MyElevatedButton(
                          onPressed: () {
                            registerCubit.sendOTP(
                              PhoneNumberCubit.countryCode +
                                  phoneNumberCubit.phonenNumberContoller.text,
                              context: context,
                            );
                          },
                          child: MyText(text: " ابعت كود التحقق"),
                        ),
                        children: [
                          MyTxtFormField(
                            controller:
                                registerCubit.verificationCodeController,
                            maxLength: 6,

                            keyboardType: TextInputType.phone,
                          ),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            builder: (context, state) {
                              return MyElevatedButton(
                                onPressed: () {
                                  registerCubit.verifyCode(
                                    "123456",
                                    context: context,
                                  );
                                },
                                child: MyText(text: "تأكيد التحقق"),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return ExpansionTile(
                        controller:
                            registerCubit.setPasswordExpansionController,
                        enabled: false,
                        title: MyText(text: " "),
                        children: [
                          MyTxtFormField(
                            controller: registerCubit.passwordController,
                            label: "😊اكتب كلمة المرور",
                            hint: "😂😂 أوعى تنساها بعد لما تكتبها ",
                            maxLength: 9,
                            maxLines: 1,
                            alignLabelWithHint: true,
                            suffixIcon: Icon(Icons.password_rounded),
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (val) {},
                            onSaved: (val) {},
                          ),
                          MyTxtFormField(
                            controller: registerCubit.confirmPasswordController,
                            label: "😁😁 اكتبها كمان مرة هنا يا حاج",
                            hint: "😅😅 نفس اللي فوق يا حاج",
                            maxLength: 9,
                            maxLines: 1,
                            alignLabelWithHint: true,
                            suffixIcon: Icon(Icons.password),
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (val) {},
                            onSaved: (val) {},
                          ),
                          MyElevatedButton(
                            onPressed: () {
                              registerCubit.validatePassword(
                                registerCubit.passwordController.text,
                                registerCubit.confirmPasswordController.text,
                                context,
                              );
                            },
                            child: MyText(
                              text: "إنشاء المجموعة والملف الشخصي الخاص بي",
                            ),
                          ),
                        ],
                      );
                    },
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
