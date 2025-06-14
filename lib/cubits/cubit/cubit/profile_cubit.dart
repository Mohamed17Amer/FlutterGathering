import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/models/drop_down_txt_field_model.dart';
import 'package:family_gathering_v_0/models/members_profile_model.dart';
import 'package:family_gathering_v_0/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

 static String? imgPath;
 static TextEditingController nameController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController fromAddressController = TextEditingController();
  static TextEditingController livingAddressController = TextEditingController();
  static Map<String?, String?>? connectionWaysMapController = {};


  FirebaseServices firebaseServices = FirebaseServices();

 static Map profileDataMap = {};


  Future<void> pickImage() async {
    emit(ProfilePictureLoading());
    File? image;
    final ImagePicker picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      image = File(picked.path);
      setMemberImage(image: image.path);
      emit(ProfilePictureUpdated());
    } else {}
  }

  setMemberImage({String? image}) {
    if (imgPath == null) {
      image = "assets/images/sms.svg"; // default image path
    } else {
      profileDataMap["img"] = imgPath;
    }
  }

  setMemberName() {
    profileDataMap["name"] = nameController.text;
  }

  setMemberPhone() {
    profileDataMap["phone"] = phoneNumberController.text;
  }

  setMemberFromAddress() {
    profileDataMap["fromAddress"] = fromAddressController.text;
  }

  setMemberLivingAddress() {
    profileDataMap["livingAddress"] = livingAddressController.text;
  }

  setMemberConnectionMap() {
    profileDataMap["memberConnectionMap"] = connectionWaysMapController;
  }

  updateProfileDataMap() {
    setMemberImage();
    setMemberName();
    setMemberPhone();
    setMemberFromAddress();
    setMemberLivingAddress();
    setMemberConnectionMap();

    return profileDataMap;
  }

  Future<void> assignProfileData() async {
    final dataMap = updateProfileDataMap();
    firebaseServices.assignProfileData(profileDataMap: dataMap);
  }

  static MemberProfileModel? currentUser;
  
  Future getCurrentUserData() async {
    await firebaseServices.getCurrentUserData();
    currentUser = FirebaseServices.currentUser;


    nameController.text = currentUser!.name!;
    phoneNumberController.text = currentUser!.phone!;
    fromAddressController.text = currentUser!.fromAddress!;
    livingAddressController.text = currentUser!.livingAddress!;
    imgPath = currentUser!.img;
    emit(GetCurrentUserDataState());
  }
}
