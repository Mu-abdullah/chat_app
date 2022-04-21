
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function() function,
  required String text,
}) =>
    GestureDetector(
      onTap:function,
      child: Container(
        width: width,
        height: 50.0,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: background,
        ),
        child: Center(
          child: Text(
              isUpperCase ? text.toUpperCase() : text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
        ),
        
       
      ),
    );