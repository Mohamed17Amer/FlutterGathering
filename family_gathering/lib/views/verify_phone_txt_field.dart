import 'package:family_gathering/widgets/custom_digit_field.dart';
import 'package:flutter/material.dart';

class VerifyNumberTxtField extends StatelessWidget {
  const VerifyNumberTxtField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             
            TxtFieldDigits(1),
            TxtFieldDigits(1),
            TxtFieldDigits(1),
            TxtFieldDigits(1),
          ],
        ),
      ),
    );
  }
}
