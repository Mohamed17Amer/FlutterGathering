import 'package:family_gathering/views/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtFieldDigits extends StatelessWidget {
  final int? numOfDigits;
  const TxtFieldDigits(this.numOfDigits, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 80,
      child: MyTxtFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(numOfDigits),
        ],
        maxLength: numOfDigits,
        padding: 2,
        onChanged: (val) {
          debugPrint("onChange $val");
          if (val.length == numOfDigits) {
            FocusScope.of(context).nextFocus();
          }
          if(val.length == 0){
            FocusScope.of(context).previousFocus();
          }
        },
        onSaved: (val) {
          debugPrint("onSaved  $val");
        },
      ),
    );
  }
}
