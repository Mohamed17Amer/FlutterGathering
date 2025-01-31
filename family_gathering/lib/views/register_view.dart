import 'package:family_gathering/screens/sign_up_screen.dart';
import 'package:family_gathering/views/widgets/custom_elevated_button.dart';
import 'package:family_gathering/views/widgets/custom_txt_field.dart';
import 'package:family_gathering/views/phone_number_txt_field.dart';
import 'package:family_gathering/views/verify_phone_txt_field.dart';
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
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.center,
          title: MyElevatedButton(
            child: Text(
              "👨‍❤️‍💋‍👨👨👶👵 جمع عيلتك",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.purple,
                fontSize: 18,
              ),
            ),
          ),
          subtitle: Text(
            "يلا جمع كل أفراد عيلتك اللي بتتواصل معاهم وسهلوا على بعض صلة الرحم ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          children: [
            MyTxtFormField(
              label: "😍😘💕 اسم العيلة أو التجمع",
              hint: " 🤔🤔 اسم عيلتك إيه؟ ",
              maxLength: 10,
              maxLines: 2,
              onChanged: (val) {},
              alignLabelWithHint: true,
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
              child: Text(
                "إنشاء كود للعيلة أو التجمع الجديد",
                style: TextStyle(fontSize: 18),
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
              child: Text(
                "استكمال البيانات لإنشاء المجموعة",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
