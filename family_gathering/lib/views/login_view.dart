import 'package:family_gathering/views/custom_txt_field.dart';
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
          title: ElevatedButton(
            onPressed: () {},
            child: Text("👨‍❤️‍💋‍👨👨👶👵 زور عيلتك", textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18
                ),),
          ),
          subtitle: Text(
              "  قَالَ رَسُولُ اللَّهِ ﷺ: مَنْ أَحَبَّ أَنْ يُبْسَطَ له فِي رِزْقِهِ، وأَنْ يُنْسَأَ لَهُ فِي أَثَرِهِ, فَلْيَصِلْ رَحِمَهُ ", style: TextStyle(fontSize: 14),),
          children: [
            //first
        
            MyTxtFormField(
              label: "😍😘💕 كود العيلة أو التجمع ",
              hint: "لو مش معاك،اطلبه من أي حد في الجروب",
              onChanged: (val) {},
              alignLabelWithHint: true, onSaved: (val) {  },
            ),
        
            ElevatedButton(
              onPressed: () {},
              child: Text("دخول العيلة"),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
