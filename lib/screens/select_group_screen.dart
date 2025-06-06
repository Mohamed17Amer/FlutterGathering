import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/sign_up_screen.dart';
import 'package:family_gathering_v_0/views/groups_view_list_view.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_txt.dart';

class SelectGroupScreen extends StatelessWidget {
  static final id = "/select_group_screen";
  int? currentUserId;
   SelectGroupScreen({super.key, this.currentUserId});

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

                  SizedBox(
                    height: 400,
                    child: GroupsView(),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          navigateTo(context, SignUpScreen.id);
                        },

                        child: MyText(
                          text: "😊 طب سجل الآن",
                          color: Colors.purple,
                        ),
                      ),
                      MyText(text: "😥😥 ليس لديك حساب؟"),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
