import 'package:country_code_picker/country_code_picker.dart';
import 'package:family_gathering_v_0/screens/sign_in_screen.dart';
import 'package:family_gathering_v_0/screens/starting_family_gathering_app.dart';
import 'package:family_gathering_v_0/screens/test.dart';
import 'package:flutter/material.dart';

import '../models/member_conniction_way_model.dart';
import '../screens/home_screen.dart';
import '../screens/select_group_screen.dart';
import '../screens/sign_up_screen.dart';

Map<String, Widget Function(BuildContext)> KRoutesMap = {
  SignUpScreen.id: (context) => SignUpScreen(),
  SignInScreen.id: (context) => SignInScreen(),

  SelectGroupScreen.id: (context) => const SelectGroupScreen(),
  StartingScreen.id: (context) => const StartingScreen(),
  HomeScreen.id: (context) => const HomeScreen(),
  PhoneAuthScreen.id: (context) => const PhoneAuthScreen(),
};
String KMembersProfileBox = "members_profile_box";
Iterable<Locale> KSupportedLocales = const [
  Locale("af"),
  Locale("am"),
  Locale("ar"),
  Locale("az"),
  Locale("be"),
  Locale("bg"),
  Locale("bn"),
  Locale("bs"),
  Locale("ca"),
  Locale("cs"),
  Locale("da"),
  Locale("de"),
  Locale("el"),
  Locale("en"),
  Locale("es"),
  Locale("et"),
  Locale("fa"),
  Locale("fi"),
  Locale("fr"),
  Locale("gl"),
  Locale("ha"),
  Locale("he"),
  Locale("hi"),
  Locale("hr"),
  Locale("hu"),
  Locale("hy"),
  Locale("id"),
  Locale("is"),
  Locale("it"),
  Locale("ja"),
  Locale("ka"),
  Locale("kk"),
  Locale("km"),
  Locale("ko"),
  Locale("ku"),
  Locale("ky"),
  Locale("lt"),
  Locale("lv"),
  Locale("mk"),
  Locale("ml"),
  Locale("mn"),
  Locale("ms"),
  Locale("nb"),
  Locale("nl"),
  Locale("nn"),
  Locale("no"),
  Locale("pl"),
  Locale("ps"),
  Locale("pt"),
  Locale("ro"),
  Locale("ru"),
  Locale("sd"),
  Locale("sk"),
  Locale("sl"),
  Locale("so"),
  Locale("sq"),
  Locale("sr"),
  Locale("sv"),
  Locale("ta"),
  Locale("tg"),
  Locale("th"),
  Locale("tk"),
  Locale("tr"),
  Locale("tt"),
  Locale("uk"),
  Locale("ug"),
  Locale("ur"),
  Locale("uz"),
  Locale("vi"),
  Locale("zh"),
];

Iterable<LocalizationsDelegate<dynamic>>? KLocalizationsDelegatesconst = [
  CountryLocalizations.delegate,
  // GlobalMaterialLocalizations.delegate,
  //GlobalWidgetsLocalizations.delegate,
];

Color? KBackgroundColor = const Color(0XFFee0097);

final List<String> KConnectionWaysLabelsList = [
  "القرية",
  "المدينة",
  "المحافظة",
  "الدولة",
];
final String KImgsPath = "assets/images/";

final List<MemberConnectionWayModel> connectionWaysList = [
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "call.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "sms.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "whatsapp.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "telegram.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "facebook.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "x.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "messenger.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "instagram.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "gmail.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "yahoo.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "youtube.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "tiktok.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "linkedin.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "instapay.svg",
    onConnectionWayPressed: () {},
  ),
  MemberConnectionWayModel(
    connectionImgPath:
        "$KImgsPath"
        "paypal.svg",
    onConnectionWayPressed: () {},
  ),
];
