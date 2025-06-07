import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/services/firebase_services.dart';
import 'package:flutter/material.dart';

part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit() : super(CreateGroupInitial());
  FirebaseServices firebaseServices = FirebaseServices();
bool isLoading = true;

  List familyGroupsList = [];
  Future<void> addNewFamilyGroup(String familyName, String familyCode) async {
    await firebaseServices.addNewFamilyGroup(familyName, familyCode);
    emit(CreateGroupSuccess());
  }

  getFamilyGroups()  async{
firebaseServices.getFamilyGroups()
  .then((v) {
    isLoading = false;
     emit(GetFamilyGroupSuccess());
  })
  .catchError((error) {
  });   
  }
}
