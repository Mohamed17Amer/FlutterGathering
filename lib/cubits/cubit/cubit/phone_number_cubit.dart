import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(PhoneNumberInitial());
  static String phoneNumber = " ";
  static String countryCode = "+20";
  TextEditingController phonenNumberContoller = TextEditingController();


  setCountryCode(String code) {
    countryCode = code;
    debugPrint("on change $code");
    emit(ChangeCountryCode());
  }

  clearPhoneNumber() {
    phoneNumber = " ";
    emit(PhoneNumberInitial());
  }

  validateTyping(String phone) {
    phoneNumber = phone;
    emit(PhoneNumberIsTyping());

 if (phone[0] == "0") {
      emit(PhoneNumberIsTyping());

      return "الرقم  مفروض يبدأ ب 1";
    }
    if (phone.length < 10) {
      emit(PhoneNumberIsTyping());

      return "لازم الرقم يكون 10 أرقام";
    }

   
    emit(PhoneNumberIsTyping());

    return "الرقم  مفروض يبدا ب 1";

    // otpExpansionController.expand();
    // registerCubit.sendOTP(countryCode+phoneNumber);
  }
}
