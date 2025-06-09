import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/models/drop_down_txt_field_model.dart';
import 'package:family_gathering_v_0/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  String? imgPath;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController fromAddressController = TextEditingController();
  TextEditingController livingAddressController = TextEditingController();

  FirebaseServices firebaseServices = FirebaseServices();

  Map profileDataMap = {};
  static Map connectionWays = {};

  List<DropDownTextFieldItemModelModel> connectionWaysValuesList = [];

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
    //log("name ${profileDataMap["name"]}");
  }

  setMemberPhone() {
    profileDataMap["phone"] = phoneNumberController.text;
    //log("name ${ profileDataMap["name"]}");
  }

  setMemberFromAddress() {
    profileDataMap["fromAddress"] = fromAddressController.text;
  }

  setMemberLivingAddress() {
    profileDataMap["livingAddress"] = livingAddressController.text;
  }

  setMemberConnectionMap(Map<String?, String?> map) {
    // member?.memberConnectionMap = map;
  }

  updateProfileDataMap() {
    /*
    profileDataMap = {
      "name": member?.name,
      "phone": member?.phone,
      "fromAddress": member?.fromAddress,
      "livingAddress": member?.livingAddress,
      "img": member?.img,
      "memberConnectionMap": member?.memberConnectionMap,
    };
*/
    setMemberImage();
    setMemberName();
    setMemberPhone();
    setMemberFromAddress();
    setMemberLivingAddress();
    profileDataMap["memberConnectionMap"] = connectionWays;

    return profileDataMap;
  }

  Future<void> assignProfileData() async {
    final dataMap = updateProfileDataMap();
    firebaseServices.assignProfileData(profileDataMap: dataMap);
  }
}
