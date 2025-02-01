import 'package:family_gathering/widgets/custom_txt.dart';
import 'package:family_gathering/widgets/custom_txt_field.dart';
import 'package:family_gathering/widgets/custom_elevated_button.dart';
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
                  onPressed: () {},
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
                          onPressed: () {},
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
