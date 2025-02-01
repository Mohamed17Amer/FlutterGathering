import 'package:family_gathering/screens/sign_up_screen.dart';
import 'package:family_gathering/widgets/custom_txt.dart';
import 'package:family_gathering/widgets/custom_txt_field.dart';
import 'package:family_gathering/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.center,
          title: MyElevatedButton(
              child: MyText(
            text: "👨‍❤️‍💋‍👨👨👶👵 جمع عيلتك",
            color: Colors.purple,
            fontSize: 18,
          )),
          subtitle: MyText(
            text:
                "يلا جمع كل أفراد عيلتك اللي بتتواصل معاهم وسهلوا على بعض صلة الرحم ",
            fontSize: 14.00,
            maxLines: 3,
          ),
          children: [
            MyTxtFormField(
              label: "😍😘💕 اسم العيلة أو التجمع",
              hint: " 🤔🤔 اسم عيلتك إيه؟ ",
              maxLength: 10,
              maxLines: 2,
              onChanged: (val) {},
              onSaved: (val) {},
            ),
            MyTxtFormField(
              label: "احتفظ بكود العيلة اللي هيظهرلك كمان شوية هنا ",
              alignLabelWithHint: true,
              isEnabled: false,
              onSaved: (val) {},
            ),
            MyElevatedButton(
              onPressed: () {},
              child: MyText(
                text: " إنشاء كود للعيلة أو التجمع الجديد",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.copy),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
              ],
            ),
            MyElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              child: MyText(
                text: "استكمال البيانات لإنشاء المجموعة",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
