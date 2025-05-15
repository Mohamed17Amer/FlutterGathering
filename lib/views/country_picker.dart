import 'package:country_code_picker/country_code_picker.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/phone_number_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryPicker extends StatelessWidget {
   CountryPicker({super.key});
  PhoneNumberCubit phoneNumberCubit = PhoneNumberCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
      builder: (context, state) {
        return CountryCodePicker(
          onChanged: (countryCode) {
            phoneNumberCubit.setCountryCode(countryCode.dialCode!);
          },
          onInit: (countryCode) {
            phoneNumberCubit.setCountryCode("+20");
          },

          initialSelection: 'EG',
          favorite: const ['EG'],
          showFlagDialog: true,
          flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          comparator: (a, b) => b.name!.compareTo(a.name!),
          hideMainText: false,
          showFlagMain: true,
          showFlag: true,
          hideSearch: false,
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
          barrierColor: Colors.black,
          backgroundColor: Colors.amber,
          dialogBackgroundColor: Colors.pink,
        );
      },
    );
  }
}
