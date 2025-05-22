import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/register_cubit.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  final CollectionReference familyGroupsCollections = FirebaseFirestore.instance
      .collection('familyGroups');

  late final QuerySnapshot<Map<String, dynamic>> familyGroupsSnapshots;
 static List<QueryDocumentSnapshot> familyGroupsList = [];

  Future<void> addNewFamilyGroup(String familyName) {
    return familyGroupsCollections
        .add({
          'name': familyName, // John Doe
        })
        .then((value) => debugPrint("group Added"))
        .catchError((error) => debugPrint("Failed to add new gruop: $error"));
  }

  getFamilyGroups() async {
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
        RegisterCubit().verificationId = verificationId;
        debugPrint(
          'verificationId $verificationId'
          'resendToken $resendToken',
        );
        showMessage('OTP sent. Please check your phone.', context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        RegisterCubit().verificationId = verificationId;
      },
    );
  }

  Future<void> verifyCode(String otp, {required BuildContext context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: RegisterCubit().verificationId!,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      showMessage('Phone number verified and user signed in.', context);
      //  navigateTo(context, SelectGroupScreen.id);
    } catch (e) {
      showMessage('Error verifying code: $e', context);
    }
  }
}
