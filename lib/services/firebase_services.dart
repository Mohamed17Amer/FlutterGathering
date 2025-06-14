import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/profile_cubit.dart';
import 'package:family_gathering_v_0/models/members_profile_model.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/select_group_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  CollectionReference familyGroupsCollection = FirebaseFirestore.instance
      .collection('familyGroups');

  final usersCollection = FirebaseFirestore.instance.collection('users');

  CollectionReference countersCollection = FirebaseFirestore.instance
      .collection('counters');
  late QuerySnapshot<Map<String, dynamic>> familyGroupsSnapshots;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> familyGroupsList =
      [];
  late QuerySnapshot<Map<String, dynamic>> usersSnapshots;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> usersList = [];
  static final groupUsersList = [];
  String? verificationId;
  static int? currentUserId;
  static int? currentGroupId;
  static MemberProfileModel? currentUser;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNewFamilyGroup(String familyName, String familyCode) async {
    final DocumentReference counterRef = countersCollection.doc(
      'familyGroupId',
    );

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
      currentGroupId = newCount; // Update the static variable
      transaction.update(counterRef, {'count': newCount});
      return newCount;
    });

    // Add new group with the auto-increment id
    await familyGroupsCollection
        .add({'id': newId, 'name': familyName, 'code': familyCode})
        .then((_) => log("Group Added with ID: $newId"))
        .catchError((error) => log("Failed to add new group: $error"));
  }

  Future<void> addNewUser(String userPhone) async {
    final DocumentReference counterRef = countersCollection.doc('userID');

    int? newUserId;
    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(counterRef);
      if (!snapshot.exists) {
        transaction.set(counterRef, {'count': 1});
        newUserId = 1;
        currentUserId = newUserId;
      } else {
        final currentCount = snapshot['count'] as int;
        newUserId = currentCount + 1;
        currentUserId = newUserId;
        transaction.update(counterRef, {'count': newUserId});
      }
    });

    await usersCollection.doc(newUserId.toString()).set({
      'phone': userPhone,
      'id': newUserId,
      'groupId': null, // Initially no group
    });
    log("User added with ID: $newUserId");
  }

  Future<void> assignUserToGroup({required int groupId}) async {
    await usersCollection.doc(currentUserId.toString()).update({
      'groupId': FieldValue.arrayUnion([groupId]),
    });
    log("User $currentUserId assigned to group $groupId");
  }

  Future<void> assignProfileData({Map? profileDataMap}) async {
    if (profileDataMap == null) {
      log('profileDataMap is null');
      return;
    }

    final DocumentReference currentRef = usersCollection.doc(
      currentUserId.toString(),
    );

    try {
      await _firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(currentRef);

        final dataToSetOrUpdate = {
          'phone': profileDataMap['phone'],
          'name': profileDataMap['name'],
          'fromAddress': profileDataMap['fromAddress'],
          'livingAddress': profileDataMap['livingAddress'],
          'img': profileDataMap['img'],
          'memberConnectionMap': profileDataMap['memberConnectionMap'] ?? {},
        };

        if (!snapshot.exists) {
          transaction.set(currentRef, dataToSetOrUpdate);
          log('Profile data set for user $currentUserId');
        } else {
          transaction.update(currentRef, dataToSetOrUpdate);
          log('Profile data updated for user $currentUserId');
          log('Updated data: $dataToSetOrUpdate');
        }
      });
    } catch (e) {
      log('Transaction failed: $e');
    }
  }

  Future<void> getAllFamilyGroups() async {
    familyGroupsList.clear();
    familyGroupsSnapshots =
        await FirebaseFirestore.instance.collection('familyGroups').get();
    familyGroupsList.addAll(familyGroupsSnapshots.docs);
  }

  Future<void> getAllUsers() async {
    usersList.clear();
    usersSnapshots = await FirebaseFirestore.instance.collection('users').get();
    usersList.addAll(usersSnapshots.docs);
  }

  Future<void> getSelectedGroupUsers(int groupId) async {
    groupUsersList.clear();
    usersSnapshots = await usersCollection.get();

    if (usersSnapshots.docs.isEmpty) {
      log("No users found with groupId: $groupId");
    } else {
      for (var doc in usersSnapshots.docs) {
        var user = doc.data();

        if ((user['groupId'] != null) &&
            (user['groupId'] as List).contains(groupId)) {
          groupUsersList.add(user);
          log(user.toString());
        }
      }
      log("final$groupUsersList");
    }
  }

  Future<void> getCurrentUserData() async {
   
  // Reference to the user document with the specified ID
  DocumentSnapshot userDoc = await usersCollection.doc(currentUserId.toString()).get();

  if (!userDoc.exists) {
    log("User with ID $currentUserId not found");
  } else  {
    var user =   userDoc.data()  as Map<String, dynamic>? ;
    currentUser = MemberProfileModel(
      name: user?['name']  ??  "اسمك",
      phone: user?['phone'] ?? "رقم التليفون",
      img: user?['img'] ?? "assets/images/sms.svg",
      fromAddress: user?['fromAddress'] ?? " اتولدت فين",
      livingAddress: user?['livingAddress'] ?? "بتعيش فين",
    );
    ProfileCubit.currentUser = currentUser;

    
    // Now, 'user' contains the data of the specific user
    log("User data: $user");
        log("curent user: ${currentUser!.name}");

  }

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
        log('verificationId: $verificationId, resendToken: $resendToken');
        showMessage('OTP sent. Please check your phone.', context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId; // consistent use
      },
    );
  }

  Future<void> verifyCode(
    String otp,
    String phone, {
    required BuildContext context,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential).then((v) {
        showMessage('Phone number verified and user signed in.', context);
      });

      await addNewUser(phone);

      //final userId = await FirebaseFirestore.instance.collection('users').get()..docs.last["userId"];
      //log("$userId ffffffffff");
      navigateTo(context, SelectGroupScreen.id);
      // Uncomment or add navigation if needed
      // navigateTo(context, YourNextScreen.id);
    } catch (e) {
      showMessage('Error verifying code: $e', context);
    }
  }
}
