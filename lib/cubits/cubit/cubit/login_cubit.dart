import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController familyCodeController = TextEditingController();
  static bool isFamilyCodeValid = false;

  setIsFamilyCodeValid(bool isValid, LoginCubit loginCubit) {
    isFamilyCodeValid = isValid;
    emit(LoginInitial());
  }

  validateFamilyCode(String familyCode, LoginCubit loginCubit) {
    setIsFamilyCodeValid(false, loginCubit);

    if (familyCodeController.text != familyCode) {
      setIsFamilyCodeValid(false, loginCubit);

      emit(LoginFailed());
      return "تأكد من الكود الصحيح من خلال أحد الأعضاء";
    } else {
      setIsFamilyCodeValid(true, loginCubit);
      emit(LoginSucceed());
      return null;
    }
  }
}
