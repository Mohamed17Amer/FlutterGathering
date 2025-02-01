import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtFieldDigits extends StatelessWidget {
  const TxtFieldDigits(this.numOfDigits, {super.key});
  final int? numOfDigits;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 60,
        height: 80,
        child: TextFormField(
          textAlign: TextAlign.center,
          maxLength: numOfDigits,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(numOfDigits),
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(
                color: Colors.black,
              ),
              gapPadding: 2.00,
            ),
          ),
          onChanged: (val) {
            debugPrint("onChange $val");
            if (val.length == numOfDigits) {
              FocusScope.of(context).nextFocus();
            }
            // ignore: prefer_is_empty
            if (val.length == 0) {
              FocusScope.of(context).previousFocus();
            }
          },
          onSaved: (val) {
            debugPrint("onSaved  $val");
          },
        ),
      ),
    );
  }
}
