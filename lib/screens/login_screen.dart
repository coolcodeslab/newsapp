import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/signup_screen.dart';
import 'package:news_app/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  final _fireStore = FirebaseFirestore.instance.collection('users');

  String email;

  String password;

  String userName;

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Login',
                  style: kHeadingTextStyle,
                ),
                SizedBox(
                  height: 50,
                ),
                //user email text form field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    onChanged: (n) {
                      email = n;
                    },
                    controller: emailTextEditingController,
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //user password text form field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    controller: passwordTextEditingController,
                    onChanged: (n) {
                      password = n;
                    },
                    obscureText: true,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Button(
                  title: 'log in',
                  login: true,
                  onTap: () async {
//                    Navigator.pushNamed(context, HomeScreen.id);
                    try {
                      setState(() {
                        loading = true;
                      });
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);


                      if (user != null) {
                        Navigator.pushNamed(context, HomeScreen.id);
                        emailTextEditingController.clear();
                        passwordTextEditingController.clear();
                      } else {
                        print('error');
                      }
                      setState(() {
                        loading = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  title: 'sign up',
                  login: false,
                  onTap: () {
                    print(_fireStore.id);
                  },
                ),
              ],
            ),
    );
  }
}
