import 'package:family_gathering_v_0/reusables_and_constatnts/constants.dart';
import 'package:flutter/material.dart';

// Function to navigate to a new screen
// Takes a BuildContext and a Widget as parameters
void navigateTo(BuildContext context, String screenId) {
  Navigator.push(context, MaterialPageRoute(builder: KRoutesMap[screenId]!));
}
