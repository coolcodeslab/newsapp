import 'dart:math';

import 'package:flutter/material.dart';

//this is only for the login and signup button
class Button extends StatelessWidget {
  Button({this.title, this.login, this.onTap});
  final String title;
  final bool login;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: login ? Colors.green : Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 30,
        width: 200,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
