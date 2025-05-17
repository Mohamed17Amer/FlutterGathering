import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTxtFormField extends StatelessWidget {
  const MyTxtFormField({
    super.key,
    this.label,
    this.hint,
    this.alignLabelWithHint,
    this.keyboardType,
    this.inputFormatters,
    this.isEnabled,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.padding,
    this.maxLines,
    this.suffixIcon,
    this.controller,
    this.decoration,
    this.onValidate,
  });

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

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final Function(String)? onChanged;
  final Function(String)? onSaved;
  final String? Function(String?)? onValidate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding ?? 18.00,
        vertical: 6.00,
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: keyboardType,
        enabled: isEnabled,
        maxLength: maxLength ?? 9,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          alignLabelWithHint: alignLabelWithHint ?? false,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        onChanged: onChanged,
        validator: onValidate,
        autovalidateMode: AutovalidateMode.always,
      ),
    );
  }
}
