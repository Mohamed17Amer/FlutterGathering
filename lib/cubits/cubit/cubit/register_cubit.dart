import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/services/firebase_services.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  ExpansionTileController setPasswordExpansionController =
      ExpansionTileController();

  FirebaseServices firebaseServices = FirebaseServices();

  Future<void> sendOTP(String phone, {required BuildContext context}) async {
    await firebaseServices.sendOTP(phone, context: context);

    emit(SendOTPSucced());
  }

  Future<void> verifyCode(String otp, String phone,{required BuildContext context}) async {
    firebaseServices
        .verifyCode(otp, phone, context: context)
        .then((result) {
       

          emit(VerifyOTPSuccssed());
        })
        .catchError((error) {
          emit(VerifyOTPFailed());
        });
  }

  Future<void> verifyCodeWithFirebase(
    String otp, phone,{
    required BuildContext context,
  }) async {
    firebaseServices
        .verifyCode(otp,phone, context: context)
        .then((result) {
          emit(VerifyOTPSuccssed());
        })
        .catchError((error) {});
    emit(VerifyOTPFailed());
  }

  List usersList = [];
  Future<void> addNewUser(String userPhone) async {
    await firebaseServices.addNewUser(userPhone);
    emit(AddUserSucceed());
  }

  Future<void> getAllUsers() async {
    firebaseServices
        .getAllUsers()
        .then((v) {
          emit(getAllUsersFailed());
        })
        .catchError((error) {});
  }
}
