import 'package:family_gathering/views/custom_txt_field.dart';
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
          title: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "👨‍❤️‍💋‍👨👨👶👵 جمع عيلتك",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          subtitle: Text(
            "يلا جمع كل أفراد عيلتك اللي بتتواصل معاهم وسهلوا على بعض صلة الرحم ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          children: [
            //first
      
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
      
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "إنشاء كود للعيلة أو التجمع الجديد",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
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
            SizedBox(
              height: 10,
            ),
            /*
            MyTxtFormField(
              label: "اكتب تليفونك تحت يا عسل ",
              hint: "اكتب تليفونك بعد كود الدولة يا عسل",
              alignLabelWithHint: true,
              isEnabled: false,
              onSaved: (val) {},
            ),
                
           
            PhoneNumberTxtField(),
                
            ExpansionTile(
              title: ElevatedButton(
                onPressed: () {},
                child: Text(" ابعت كود التحقق"),
              ),
              children: [
                VerifyNumberTxtField(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("تأكيد التحقق"),
                ),
              ],
            )
            */
          ],
        ),
      ),
    );
  }
}
