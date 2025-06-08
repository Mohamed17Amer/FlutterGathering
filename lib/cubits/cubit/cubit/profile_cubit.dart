import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/models/members_profile_model.dart';
import 'package:family_gathering_v_0/services/firebase_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  MemberProfileModel? member;
  ProfileCubit(this.member) : super(ProfileInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController fromAddressController = TextEditingController();
  TextEditingController livingAddressController = TextEditingController();

    FirebaseServices firebaseServices = FirebaseServices();

Map profileDataMap = {};

  Future<void> pickImage() async {
    emit(ProfilePictureLoading());
    File? image;
    final ImagePicker picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      image = File(picked.path);
      setMemberImage(image.path);
      emit(ProfilePictureUpdated());
    } else {}
  }
  saveProfileData() {

  }
   setMemberImage(String image) {
    member?.img = image;
  }

  setMemberName(String name) {
    member?.name = name;
  }
  setMemberPhone(String phone) {
    member?.phone = phone;
  }
  setMemberFromAddress(String fromAddress) {
   // member?.fromAddress = fromAddress;
  }

  setMemberLivingAddress(String livingAddress) {
   // member?.livingAddress = livingAddress;
  }
 
  setMemberConnectionMap(Map<String?, String?> map) {
    member?.memberConnectionMap = map;
  }

  updateProfileDataMap() {
    profileDataMap = {
      "name": member?.name,
    //  "phone": member?.phone,
      "fromAddress": member?.fromAddress,
      "livingAddress": member?.livingAddress,
      "img": member?.img,
      "memberConnectionMap": member?.memberConnectionMap,
    };
    
    return profileDataMap;
  }
  
  Future<void> assignProfileData() async {
    final dataMap = updateProfileDataMap();
    firebaseServices.assignProfileData(profileDataMap: dataMap);
  }
 
}
