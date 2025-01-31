import 'package:family_gathering/screens/sign_in_screen.dart';
import 'package:family_gathering/views/widgets/custom_elevated_button.dart';
import 'package:family_gathering/views/widgets/custom_txt_field.dart';
import 'package:family_gathering/views/phone_number_txt_field.dart';
import 'package:family_gathering/views/verify_phone_txt_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
              "👨‍❤️‍💋‍👨👨👶👵 زور عيلتك",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.purple, fontSize: 18),
            ),
          ),
          subtitle: Text(
            "  قَالَ رَسُولُ اللَّهِ ﷺ: مَنْ أَحَبَّ أَنْ يُبْسَطَ له فِي رِزْقِهِ، وأَنْ يُنْسَأَ لَهُ فِي أَثَرِهِ, فَلْيَصِلْ رَحِمَهُ ",
            style: TextStyle(fontSize: 14),
          ),
          children: [
            MyTxtFormField(
              label: "😍😘💕 كود العيلة أو التجمع ",
              hint: "لو مش معاك،اطلبه من أي حد في الجروب",
              onChanged: (val) {},
              alignLabelWithHint: true,
              onSaved: (val) {},
            ),
            MyElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              },
              child: Text("دخول العيلة"),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
