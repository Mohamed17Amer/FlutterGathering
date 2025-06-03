import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/select_group_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  CollectionReference familyGroupsCollection = FirebaseFirestore.instance
      .collection('familyGroups');

  CollectionReference usersCollection = FirebaseFirestore.instance.collection(
    'users',
  );

  late QuerySnapshot<Map<String, dynamic>> familyGroupsSnapshots;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> familyGroupsList =
      [];
  late QuerySnapshot<Map<String, dynamic>> usersSnapshots;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> usersList = [];
  String? verificationId;
/*
  Future<void> addNewDocInCollection(
    CollectionReference collection,
    Map<String, dynamic> data,
  ) {
    return collection
        .add({
          data.keys.toList()[0]: data.entries.toList()[0],
          data.keys.toList()[1]: data.entries.toList()[1],
        })
        .then((value) => debugPrint(" Added"))
        .catchError((error) => debugPrint("Failed to add new : $error"));
  }
*/

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addNewFamilyGroup(String familyName, String familyCode) async {
  final counterRef = _firestore.collection('counters').doc('familyGroupId');

  // Atomically increment the counter and get the new value
  final newId = await _firestore.runTransaction((transaction) async {
    final snapshot = await transaction.get(counterRef);
    int currentCount = 0;

    if (snapshot.exists) {
      currentCount = snapshot.get('count') as int;
    } else {
      transaction.set(counterRef, {'count': 0});
    }

    final newCount = currentCount + 1;
    transaction.update(counterRef, {'count': newCount});
    return newCount;
  });

  // Add new group with the auto-increment id
  await _firestore.collection('familyGroups').add({
    'id': newId,
    'name': familyName,
    'code': familyCode,
  }).then((_) => print("Group Added with ID: $newId"))
    .catchError((error) => print("Failed to add new group: $error"));
}


  Future<void> addNewUser(String userPhone) async {
    final DocumentReference counterRef = _firestore
        .collection('counters')
        .doc('userID');

    // Run a transaction to atomically increment the counter
    int? newUserId;
    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(counterRef);
      if (!snapshot.exists) {
        // Initialize counter if it does not exist
        transaction.set(counterRef, {'count': 1});
        newUserId = 1;
      } else {
        final currentCount = snapshot['count'] as int;
        newUserId = currentCount + 1;
        transaction.update(counterRef, {'count': newUserId});
      }
    });

    // Add user with the new id
    await usersCollection.doc(newUserId.toString()).set({
      'phone': userPhone,
      'id': newUserId,
    });
    debugPrint("User added with ID: $newUserId");
  }

  Future<void> getFamilyGroups() async {
    familyGroupsList.clear();
    familyGroupsSnapshots =
        await FirebaseFirestore.instance.collection('familyGroups').get();
    familyGroupsList.addAll(familyGroupsSnapshots.docs);
  }

  Future<void> getUsers() async {
    usersList.clear();
    usersSnapshots = await FirebaseFirestore.instance.collection('users').get();
    usersList.addAll(usersSnapshots.docs);
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
