import 'package:chat_app/constants/const.dart';
import 'package:flutter/material.dart';

Widget defaultFormField(context,{
  TextEditingController? controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  Widget? suffix,
}) =>
    Container(
      constraints : BoxConstraints(minWidth: double.infinity, maxHeight: MediaQuery.of(context).size.height*.2),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        maxLines: null,
        focusNode: FocusNode(),
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: (data) {
          if (data!.isEmpty) {
            return "field is required";
          }
          return null;
        },
        decoration: InputDecoration(
          label: Text(label,style: TextStyle(
            color: kPrimaryColor
          ),),
          fillColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          prefixIcon: Icon(
            prefix,
            color: kPrimaryColor,
          ),
          suffixIcon: suffix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
