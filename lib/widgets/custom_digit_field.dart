import 'package:family_gathering_v_0/cubits/cubit/cubit/phone_number_cubit.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtFieldDigits extends StatefulWidget {
  const TxtFieldDigits(this.numOfDigits, {super.key});
  final int? numOfDigits;

  @override
  State<TxtFieldDigits> createState() => _TxtFieldDigitsState();
}

class _TxtFieldDigitsState extends State<TxtFieldDigits> {
  RegisterCubit registerCubit = RegisterCubit();
  PhoneNumberCubit phoneNumberCubit = PhoneNumberCubit();
TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 60,
        height: 80,
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          maxLength: widget.numOfDigits,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(widget.numOfDigits),
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.black),
              gapPadding: 2.00,
            ),
          ),
          onChanged: (val) {
          },
          
         

          validator: (val) {
            debugPrint("validator $val");
          
            setState(() {});
            return null;
          },
        ),
      ),
    );
  }
}
