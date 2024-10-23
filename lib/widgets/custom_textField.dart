import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/Utils/colors.dart';
import 'package:tic_tac_toe_game/responsive/responsive.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;

  const CustomTextfield(
      {super.key, required this.controller, required this.hintText,this.isReadOnly =false});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent,
              blurRadius: 5,
              spreadRadius: 1,
            )
          ],
        ),
        child: TextField(cursorColor: Colors.white,
          controller: controller,
          readOnly: isReadOnly,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            fillColor: bgColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
