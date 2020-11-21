import 'package:flutter/material.dart';

const kButtonColor = Color(0xff777777);
const kHeadingTextStyle = TextStyle(
  color: Color(0xff777777),
  fontSize: 40,
  fontWeight: FontWeight.bold,
);
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your email',
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  disabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
);
