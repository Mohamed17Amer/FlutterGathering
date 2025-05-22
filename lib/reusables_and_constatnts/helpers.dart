import 'package:family_gathering_v_0/screens/create_group_screen.dart';
import 'package:family_gathering_v_0/screens/select_group_screen.dart';
import 'package:family_gathering_v_0/screens/sign_in_screen.dart';
import 'package:family_gathering_v_0/screens/sign_up_screen.dart';
import 'package:family_gathering_v_0/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';
import 'dart:math';

import '../screens/home_screen.dart';
import '../screens/starting_family_gathering_app.dart';

Map<String, Widget Function(BuildContext)> KRoutesMap = {
  SignUpScreen.id: (context) => SignUpScreen(),
  SignInScreen.id: (context) => SignInScreen(),

  SelectGroupScreen.id: (context) => const SelectGroupScreen(),
  CreateGroupScreen.id: (context) =>  CreateGroupScreen(),
  StartingScreen.id: (context) => const StartingScreen(),
  HomeScreen.id: (context) => const HomeScreen(),
  PhoneAuthScreen.id: (context) => const PhoneAuthScreen(),
};

// Function to navigate to a new screen
// Takes a BuildContext and a Widget as parameters
void navigateTo(BuildContext context, String screenId) {
  Navigator.push(context, MaterialPageRoute(builder: KRoutesMap[screenId]!));
}

Set<String> existingCodes = {}; // Set to store existing codes
String generateCode(int length, Set<String> existingCodes) {
  const characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  String code;

  do {
    code =
        List.generate(
          length,
          (_) => characters[random.nextInt(characters.length)],
        ).join();
  } while (existingCodes.contains(code)); // ensure uniqueness

  existingCodes.add(code); // save for future checks
  return code;
}

showToastification({BuildContext? context, String? message}) {
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    title: Text(message!),
    animationDuration: const Duration(seconds: 2),
    autoCloseDuration: const Duration(seconds: 2),
  );
}

copyToClipboard({String? text}) {
  Clipboard.setData(ClipboardData(text: text!));
}


void showMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }


     generateRandomColor() {
    final random = Random();
    final  color = Color.fromARGB(
        255, // full opacity
        random.nextInt(256), // red
        random.nextInt(256), // green
        random.nextInt(256), // blue
      );

      return color;
   
  }