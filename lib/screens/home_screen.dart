import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/screens/headlines_screen.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screens/profile_screen.dart';
import 'package:news_app/services/news.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance.collection('users');

  NewsModel newsModel = NewsModel();
  String sportsImageUrl =
      "https://sportshub.cbsistatic.com/i/r/2020/11/01/7ae8e30d-680f-4c42-8ed6-5da97031a632/thumbnail/1200x675/4fa6ab971c49d75978ab11b220de1d10/template.jpg";
  String businessImageUrl =
      "https://techcrunch.com/wp-content/uploads/2020/10/GettyImages-1227124558.jpg?w=600";
  String entertainmentImageUrl =
      "https://static.foxnews.com/foxnews.com/content/uploads/2020/08/GettyImages-1148003885.jpg";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'News',
          style: kHeadingTextStyle,
        ),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            height: 417,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Menu(
                  imageUrl: sportsImageUrl,
                  color: Colors.yellow,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HeadlinesScreen(category: 'sports'),
                      ),
                    );
                  },
                  title: 'sports',
                ),
                Menu(
                  imageUrl: businessImageUrl,
                  color: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HeadlinesScreen(category: 'business'),
                      ),
                    );
                  },
                  title: 'business',
                ),
                Menu(
                  imageUrl: entertainmentImageUrl,
                  color: Colors.pink,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HeadlinesScreen(category: 'entertainment'),
                      ),
                    );
                  },
                  title: 'entertainment',
                ),
              ],
            ),
          ),
          Container(
            height: height,
            width: width,
          ),
          //go to profile button
          Positioned(
            right: 30,
            bottom: 90,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProfileScreen.id,
                );
              },
              child: Container(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: kButtonColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          // log out button
          Positioned(
            right: 30,
            bottom: 30,
            child: GestureDetector(
              onTap: () async {
                await _auth.signOut();
                Navigator.pop(context);
              },
              child: Container(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: kButtonColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  Menu({this.color, this.onTap, this.title, this.imageUrl});
  final Color color;
  final Function onTap;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            width: 193,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageUrl == null ? null : NetworkImage(imageUrl),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 193,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: RotatedBox(
              quarterTurns: -1,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: kHeadingTextStyle.copyWith(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
