import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController familyCodeController = TextEditingController();
   late bool isFamilyCodeValid;

  setIsFamilyCodeValid(bool isValid, LoginCubit loginCubit) {
     loginCubit.isFamilyCodeValid = isValid;
    emit(LoginInitial());
  }

  validateFamilyCode(String familyCode, LoginCubit loginCubit) {

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

  int selectedIndex = 0;

  changeTabeIndex(int index) {

  selectedIndex = index;

    emit(ChangeTabIndex());
  }
}
