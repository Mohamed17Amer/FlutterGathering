import 'package:family_gathering/views/widgets/custom_elevated_button.dart';
import 'package:family_gathering/views/widgets/custom_txt_field.dart';

import 'package:family_gathering/views/phone_number_txt_field.dart';
import 'package:family_gathering/views/verify_phone_txt_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyElevatedButton(
                  height: 100,
                  onPressed: () {},
                  child: const Text(
                    "يلا نسجل الدخول علشان نزور أهالينا يا جميل ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.purple, fontSize: 22),
                  ),
                ),
                MyTxtFormField(
                  label: "😊اكتب كلمة المرور",
                  hint: "😂😂 أوعى تكون نسيتها ",
                  maxLength: 9,
                  maxLines: 1,
                  onChanged: (val) {},
                  alignLabelWithHint: true,
                  suffixIcon: Icon(Icons.remove_red_eye),
                  onSaved: (val) {},
                ),
                MyElevatedButton(
                  onPressed: () {},
                  child: Text("الدخول إلى تجمع عائلتي باستخدام هذا الهاتف"),
                ),
                Column(
                  children: [
                    Text("😓😓 نسيت كلمة السر يا فالح؟"),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "😡😡 طب اضغط هنا",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("😊 طب سجل الآن"),
                        ),
                        Text("😥😥 ليس لديك حساب؟"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
