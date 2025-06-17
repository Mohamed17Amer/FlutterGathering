import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../models/member_conniction_way_model.dart';


String  KMembersProfileBox = "members_profile_box";
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
 ''"Call",
  "SMS",
  "WhatsApp",
  "Telegram",
  "Facebook",
  "X (Twitter)",
  "Messenger",
  "Instagram",
  "Gmail",
  "Yahoo Mail",
  "YouTube",
  "TikTok",
  "LinkedIn",
  "InstaPay",
  "PayPal"
];
final String KImgsPath = "assets/images/";

/*
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

*/
final List<Map<String, MemberConnectionWayModel>> connectionWaysList = [
  {
    "Call": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "call.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "SMS": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "sms.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "WhatsApp": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "whatsapp.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "Telegram": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "telegram.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "Facebook": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "facebook.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "X (Twitter)": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "x.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "Messenger": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "messenger.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "Instagram": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "instagram.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "Gmail": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "gmail.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "Yahoo Mail": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "yahoo.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "YouTube": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "youtube.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "TikTok": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "tiktok.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "LinkedIn": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "linkedin.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "InstaPay": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "instapay.svg",
      onConnectionWayPressed: () {},
    ),
  },
  {
    "PayPal": MemberConnectionWayModel(
      connectionImgPath: "$KImgsPath" "paypal.svg",
      onConnectionWayPressed: () {},
    ),
  },
];