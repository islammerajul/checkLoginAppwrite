import 'package:chips_practice/models/login_cred_model.dart';
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  CustomTextFromField({
    super.key,
    required this.onSaved,
    this.label,
    this.validator,
  });

  //final LoginCredModel _loginCredModel;
  String? label;
  dynamic validator;
  dynamic onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
