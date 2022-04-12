import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  Widget? suffix,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    fillColor: Colors.black,
    focusedBorder:OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.circular(25.0),
    ),
    prefixIcon: Icon(
      prefix,
    ),
     //suffix: suffix,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);