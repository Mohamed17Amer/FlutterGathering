import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTxtFormField extends StatelessWidget {
  const MyTxtFormField(
      {super.key,
      this.label,
      this.hint,
      this.alignLabelWithHint,
      this.keyboardType,
      this.inputFormatters,
      this.isEnabled,
      this.onChanged,
      this.onSaved,
      this.maxLength,
      this.padding, this.maxLines, 
      this.suffixIcon});

  final String? label;
  final String? hint;
  final bool? alignLabelWithHint;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isEnabled;
  final int? maxLength;
  final int? maxLines;
  final double? padding;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: padding ?? 18.00, vertical: 6.00),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        //  alignLabelWithHint: ,
        suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        textAlign: TextAlign.center,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        enabled: isEnabled,
        onChanged: onChanged,
        maxLength: maxLength,
        maxLines: maxLines??1,
        
      ),
    );
  }
}
