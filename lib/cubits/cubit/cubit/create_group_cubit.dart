import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/screens/services/firebase_services.dart';
import 'package:family_gathering_v_0/views/add_group_item.dart';
import 'package:family_gathering_v_0/views/group_view_item.dart';
import 'package:flutter/material.dart';

part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit() : super(CreateGroupInitial());
  FirebaseServices firebaseServices = FirebaseServices();

  List familyGroupsList = [];
  Future<void> addNewFamilyGroup(String familyName) async {
    await firebaseServices.addNewFamilyGroup(familyName);
    emit(CreateGroupSuccess());
  }

  getFamilyGroups()  async{
      await  firebaseServices.getFamilyGroups();
    emit(GetFamilyGroupSuccess());
  }
}
