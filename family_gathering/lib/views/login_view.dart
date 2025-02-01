import 'package:family_gathering/screens/sign_in_screen.dart';
import 'package:family_gathering/widgets/custom_txt.dart';
import 'package:family_gathering/widgets/custom_txt_field.dart';
import 'package:family_gathering/widgets/custom_elevated_button.dart';
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
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.center,
          title: MyElevatedButton(
            child: MyText(
                text: "👨‍❤️‍💋‍👨👨👶👵 زور عيلتك", color: Colors.purple),
          ),
          subtitle: MyText(
            text:
                "  قَالَ رَسُولُ اللَّهِ ﷺ: مَنْ أَحَبَّ أَنْ يُبْسَطَ له فِي رِزْقِهِ، وأَنْ يُنْسَأَ لَهُ فِي أَثَرِهِ, فَلْيَصِلْ رَحِمَهُ ",
            fontSize: 14.00,
            maxLines: 3,
          ),
          children: [
            MyTxtFormField(
              label: "😍😘💕 كود العيلة أو التجمع ",
              hint: "لو مش معاك،اطلبه من أي حد في الجروب",
           
              alignLabelWithHint: true,
              onChanged: (val) {},
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
              child: MyText(
                text: "دخول العيلة",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
