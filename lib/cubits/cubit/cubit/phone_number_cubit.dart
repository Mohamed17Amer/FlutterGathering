import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
part 'phone_number_state.dart';


class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(PhoneNumberInitial());
  static String phoneNumber = "";
  static String countryCode = "+20";
  TextEditingController phonenNumberContoller = TextEditingController();
    TextEditingController verificationCodeController = TextEditingController();

    ExpansionTileController otpExpansionController = ExpansionTileController();
    RegisterCubit registerCubit = RegisterCubit();

  bool? isPhoneNumberValid ;

  void setIsPhoneValid(bool val) {
    isPhoneNumberValid = val;
    emit(PhoneNumberValid());
  }

  setCountryCode(String code) {
    countryCode = code;
    debugPrint("on change $code");
    emit(ChangeCountryCode());
  }

  clearPhoneNumber() {
    phoneNumber = "";
    emit(PhoneNumberInitial());
  }

  validateTypingPhone(String phone) {
    phoneNumber = phone;
    setIsPhoneValid(false);
    emit(PhoneNumberIsTyping());

    if (phone.isNotEmpty && phone[0] == "0") {
      setIsPhoneValid(false);
      emit(PhoneNumberIsTyping());

      return "الرقم  مفروض يبدأ ب 1";
    } else if (phone.length < 10) {
      setIsPhoneValid(false);
      emit(PhoneNumberIsTyping());

      return "لازم الرقم يكون 10 أرقام";
    } else if (phone.length == 10) {
      setIsPhoneValid(true); 
      
      
      emit(PhoneNumberValid());
    }

    emit(PhoneNumberIsTyping());
  }

  openValidationExpansionTile(String phone) {
    if(phone.length==10 && phone[0] == "1") {
      otpExpansionController.expand();

      
    }
    emit(PhoneNumberValid());
  }
}
