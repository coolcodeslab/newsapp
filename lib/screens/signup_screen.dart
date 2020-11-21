import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance.collection('users');
  String email;
  String password1;
  String password2;
  String userName;

  static const id = 'sign up screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Sign Up',
            style: kHeadingTextStyle,
          ),
          SizedBox(
            height: 50,
          ),
          //email text form field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              onChanged: (n) {
                email = n;
              },
              decoration: kTextFieldDecoration,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //user name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              onChanged: (n) {
                userName = n;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter a username'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //users 1 password
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              onChanged: (n) {
                password1 = n;
              },
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //users second password
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              onChanged: (n) {
                password2 = n;
              },
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Confirm your password',
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Button(
            title: 'Sign up',
            login: false,
            onTap: () {
              //checks of the password are similar and sign them up
              if (email != null && password1 == password2) {
                _fireStore.add({
                  'email': email,
                  'password': password2,
                  'userName': userName,
                });
                _auth.createUserWithEmailAndPassword(
                    email: email, password: password2);
                Navigator.pushNamed(context, HomeScreen.id);
              } else {
                print('cant sigup user');
              }
            },
          ),
        ],
      ),
    );
  }
}
