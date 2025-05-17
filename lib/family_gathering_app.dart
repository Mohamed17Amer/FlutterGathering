import 'package:family_gathering_v_0/cubits/cubit/cubit/phone_number_cubit.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/profile_cubit.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/register_cubit.dart';
import 'package:family_gathering_v_0/models/members_profile_model.dart';
import 'package:family_gathering_v_0/screens/profile_screen.dart';
import 'package:family_gathering_v_0/screens/select_group_screen.dart';
import 'package:family_gathering_v_0/screens/sign_up_screen.dart';
import 'package:family_gathering_v_0/screens/starting_family_gathering_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return ToastificationWrapper(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => PhoneNumberCubit()),
          BlocProvider(create: (context) => ProfileCubit(MemberProfileModel())),

        ],

        child: MaterialApp(
          title: 'عيلتنا متجمعة',
          routes: KRoutesMap,
          theme: ThemeData(
            scaffoldBackgroundColor: KBackgroundColor,

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          supportedLocales: KSupportedLocales, //constants file
          localizationsDelegates: KLocalizationsDelegatesconst, //constants file
          initialRoute: SelectGroupScreen.id,
        ),
      ),
    );
  }
}
