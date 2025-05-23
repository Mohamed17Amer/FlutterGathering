import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/select_group_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  CollectionReference familyGroupsCollection = FirebaseFirestore.instance
      .collection('familyGroups');
  late QuerySnapshot<Map<String, dynamic>> familyGroupsSnapshots;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> familyGroupsList =
      [];

  String? verificationId;

  Future<void> addNewFamilyGroup(String familyName, String familyCode) {
    return familyGroupsCollection
        .add({'name': familyName, 'code': familyCode})
        .then((value) => debugPrint("Group Added"))
        .catchError((error) => debugPrint("Failed to add new group: $error"));
  }

  Future<void> getFamilyGroups() async {
    familyGroupsList.clear();
    familyGroupsSnapshots =
        await FirebaseFirestore.instance.collection('familyGroups').get();
    familyGroupsList.addAll(familyGroupsSnapshots.docs);
  }

  Future<void> sendOTP(String phone, {required BuildContext context}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification
        await FirebaseAuth.instance.signInWithCredential(credential);
        showMessage(
          'Phone number automatically verified and user signed in.',
          context,
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        showMessage('Verification failed: ${e.message}', context);
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId =
            verificationId; // Use the same registerCubit instance
        debugPrint(
          'verificationId: $verificationId, resendToken: $resendToken',
        );
        showMessage('OTP sent. Please check your phone.', context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId; // consistent use
      },
    );
  }

  Future<void> verifyCode(String otp, {required BuildContext context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      showMessage('Phone number verified and user signed in.', context);
      navigateTo(context, SelectGroupScreen.id);
      // Uncomment or add navigation if needed
      // navigateTo(context, YourNextScreen.id);
    } catch (e) {
      showMessage('Error verifying code: $e', context);
    }
  }
}
