import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/screens/services/firebase_services.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  String? verificationId;

  TextEditingController verificationCodeController = TextEditingController();

  ExpansionTileController setPasswordExpansionController =
      ExpansionTileController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  FirebaseServices firebaseServices = FirebaseServices();

  Future<void> sendOTP(String phone, {required BuildContext context}) async {
    await firebaseServices.sendOTP(phone, context: context);

    emit(SendOTPSucced());
  }

  Future<void> verifyCode(String otp, {required BuildContext context}) async {
    await firebaseServices.verifyCode(otp, context: context);
    emit(VerifyOTPFailed());
  }
}
