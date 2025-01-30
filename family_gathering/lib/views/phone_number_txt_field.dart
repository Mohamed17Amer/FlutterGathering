import 'package:family_gathering/views/country_picker.dart';
import 'package:family_gathering/views/txt_field_digits.dart';
import 'package:flutter/material.dart';

class PhoneNumberTxtField extends StatelessWidget {
  const PhoneNumberTxtField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CountryPicker(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TxtFieldDigits(2),
              TxtFieldDigits(2),
              TxtFieldDigits(2),
              TxtFieldDigits(2),
              TxtFieldDigits(2),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
