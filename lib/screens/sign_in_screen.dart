
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/sign_up_screen.dart';
import 'package:family_gathering_v_0/screens/starting_family_gathering_app.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_txt.dart';
import '../widgets/custom_txt_field.dart';

class SignInScreen extends StatelessWidget {
  static final  id = "/sign_in_screen";
  const SignInScreen({super.key});

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
                  width: 320,
                  height: 80,
                  onPressed: () {},
                  child: const MyText(
                    text: "يلا نسجل الدخول علشان نزور أهالينا يا جميل ",
                    maxLines: 2,
                  ),
                ),
                MyTxtFormField(
                  label: "😊اكتب كلمة المرور",
                  hint: "😂😂 أوعى تكون نسيتها ",
                  maxLength: 9,
                  maxLines: 1,
                
                  alignLabelWithHint: true,
                  suffixIcon: Icon(Icons.remove_red_eye),
                    onChanged: (val) {},
                  onSaved: (val) {},
                ),
                MyElevatedButton(
                  onPressed: () {
                    navigateTo(context, StartingScreen.id);
                  },
                  child: MyText(
                    text: "الدخول إلى تجمع عائلتي باستخدام هذا الهاتف",
                    fontSize: 16,
                  ),
                ),
                Column(
                  children: [
                    MyText(text: "😓😓 نسيت كلمة السر يا فالح؟"),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: MyText(
                        text: "😡😡 طب اضغط هنا",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            navigateTo(context, SignUpScreen.id);
                          },
                          child: MyText(text: "😊 طب سجل الآن"),
                        ),
                        MyText(text: "😥😥 ليس لديك حساب؟"),
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
