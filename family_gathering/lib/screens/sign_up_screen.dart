import 'package:family_gathering/widgets/custom_txt.dart';
import 'package:family_gathering/widgets/custom_txt_field.dart';
import 'package:family_gathering/widgets/custom_elevated_button.dart';
import 'package:family_gathering/views/phone_number_txt_field.dart';
import 'package:family_gathering/views/verify_phone_txt_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyElevatedButton(
                width: 320,
                child: MyText(
                  text: " يلا نكمل البيانات يا جميل  ",
                  fontSize: 30,
                  color: Colors.purple,
                ),
              ),
              MyTxtFormField(
                label: "اكتب تليفونك تحت يا عسل ",
                hint: "اكتب تليفونك بعد كود الدولة يا عسل",
                alignLabelWithHint: true,
                isEnabled: false,
                onSaved: (val) {},
              ),
              PhoneNumberTxtField(),
              ExpansionTile(
                title: MyElevatedButton(
                  onPressed: () {},
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
                    onPressed: () {},
                    child:
                        MyText(text: "إنشاء المجموعة والملف الشخصي الخاص بي"),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
