
import 'package:family_gathering_v_0/views/country_picker.dart' show CountryPicker;
import 'package:flutter/material.dart';

import '../widgets/custom_digit_field.dart';

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
