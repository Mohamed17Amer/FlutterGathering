import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/helpers.dart';
import 'package:family_gathering_v_0/screens/select_group_screen.dart';
import 'package:family_gathering_v_0/screens/starting_family_gathering_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> sendOTP(String phone, {required BuildContext context}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification
        await FirebaseAuth.instance.signInWithCredential(credential);
        _showMessage(
          'Phone number automatically verified and user signed in.',
          context,
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        _showMessage('Verification failed: ${e.message}', context);
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        debugPrint(
          'verificationId $verificationId' + 'resendToken $resendToken',
        );
        _showMessage('OTP sent. Please check your phone.', context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
    );

    emit(SendOTPSucced());
  }

  Future<void> verifyCode(String otp, {required BuildContext context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      _showMessage('Phone number verified and user signed in.', context);
    //  navigateTo(context, SelectGroupScreen.id);

      emit(VerifyOTPSuccssed());
    } catch (e) {
      _showMessage('Error verifying code: $e', context);
      emit(VerifyOTPFailed());
    }
  }

  void _showMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void validatePassword(String pass1, String pass2, BuildContext context) {
    if (pass1 == pass2) {
      _showMessage('Password is valid', context);
      navigateTo(context, SelectGroupScreen.id);

      emit(RegisterSucceed());
    } else {
      _showMessage('Password does not match', context);
      emit(RegisterFailed());
    }
  }
}
