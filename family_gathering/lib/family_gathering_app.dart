import 'package:family_gathering/screens/register_and_login_screen.dart';
import 'package:family_gathering/screens/starting_family_gathering_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'reusables_and_constatnts/constants.dart';

class FamilyGatheringApp extends StatefulWidget {
  const FamilyGatheringApp({super.key});

  @override
  State<FamilyGatheringApp> createState() => _FamilyGatheringAppState();
}

class _FamilyGatheringAppState extends State<FamilyGatheringApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        FlutterNativeSplash.remove();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عيلتنا متجمعة',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      supportedLocales: supportedLocales, //constants file
      localizationsDelegates: localizationsDelegatesconst, //constants file
      home: const StartingFamilyGatheringApp(),
    );
  }
}
