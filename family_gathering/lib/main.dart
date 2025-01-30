import 'package:family_gathering/family_gathering_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);  

  runApp(const FamilyGatheringApp());
}

