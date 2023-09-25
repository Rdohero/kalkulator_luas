import 'package:flutter/material.dart';

Widget myTextField(TextEditingController controller, String myLabel, bool obscure, TextInputType text) {
  return Container(
    margin: EdgeInsets.only(top: 5, right: 10, left: 10),
    child: TextField(
      style: TextStyle(color: Color(0xFF4BA3A3)),
      autofocus: false,
      controller: controller,
      obscureText: obscure,
      keyboardType: text,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF4BA3A3)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF4BA3A3)),
        ),
        hintText: myLabel,
        hintStyle: TextStyle(color: Color(0xFF4BA3A3)),
      ),
    ),
  );
}