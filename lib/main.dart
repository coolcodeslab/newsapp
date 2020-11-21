import 'package:flutter/material.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:news_app/screens/profile_screen.dart';
import 'package:news_app/screens/signup_screen.dart';
import 'constants.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/headlines_screen.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        HeadlinesScreen.id: (context) => HeadlinesScreen(),
        NewsScreen.id: (context) => NewsScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
      },
    );
  }
}
