import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/login_cubit.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/starting_family_gathering_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_elevated_button.dart' show MyElevatedButton;
import '../widgets/custom_txt.dart' show MyText;
import '../widgets/custom_txt_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key, this.familyGroupMap});
  static final id = "/sign_in_screen";
  LoginCubit loginCubit = LoginCubit();
  QueryDocumentSnapshot<Map<String, dynamic>>? familyGroupMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
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
                  text: "👨‍❤️‍💋‍👨👨👶👵 زور عيلتك",
                  color: Colors.purple,
                ),
              ),
              subtitle: MyText(
                text:
                    "  قَالَ رَسُولُ اللَّهِ ﷺ: مَنْ أَحَبَّ أَنْ يُبْسَطَ له فِي رِزْقِهِ، وأَنْ يُنْسَأَ لَهُ فِي أَثَرِهِ, فَلْيَصِلْ رَحِمَهُ ",
                fontSize: 14.00,
                maxLines: 3,
              ),
              children: [
                MyTxtFormField(
                  controller: loginCubit.familyCodeController,
                  maxLength: 6,
                  label: "😍😘💕 كود العيلة أو التجمع ",
                  hint: "لو مش معاك ،اطلبه من أي حد في الجروب",

                  alignLabelWithHint: true,
                  onChanged: (val) {},
                  onSaved: (val) {},
                  onValidate: (val) {
                    return loginCubit.validateFamilyCode(
                      familyGroupMap?['code'],loginCubit
                    );
                  },
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return MyElevatedButton(
                      onPressed:(LoginCubit.isFamilyCodeValid==false)?  () {
                        navigateTo(context, StartingScreen.id);
                      }: null,
                      child: MyText(text: "دخول العيلة"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
