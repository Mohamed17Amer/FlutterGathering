import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/sign_in_screen.dart';
import 'package:family_gathering_v_0/views/phone_number_txt_field.dart'
    show PhoneNumberTxtField;
import 'package:family_gathering_v_0/widgets/custom_elevated_button.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart'
    show MyTxtFormField;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../views/verify_phone_txt_field.dart' show VerifyNumberTxtField;
import '../widgets/custom_txt.dart';

class SignUpScreen extends StatefulWidget {
  static final id = "/sign_up_screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var verificationId;

  var smsCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
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

                  PhoneNumberTxtField(),
                  ExpansionTile(
                    title: MyElevatedButton(
                      onPressed: () async {
                        setState(() {
                          verifyPhoneNumber("+201011245647");
                        });
                      },
                      child: MyText(text: " ابعت كود التحقق"),
                    ),
                    children: [
                      VerifyNumberTxtField(),
                      MyElevatedButton(
                        onPressed: () {},
                        child: MyText(text: "تأكيد التحقق"),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: MyText(text: " "),
                    children: [
                      MyTxtFormField(
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
                          navigateTo(context, SignInScreen.id);
                        },
                        child: MyText(
                          text: "إنشاء المجموعة والملف الشخصي الخاص بي",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void verifyPhoneNumber(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+201120185731',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code
          String smsCode = 'xxxx';

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );

          // Sign the user in (or link) with the credential
      //    await auth.signInWithCredential(credential);
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      } else {
        print('Error: ${e.message}');
      }
    } on Exception catch (e) {
      print('Error verifying phone number: $e');
    }
  }
}
