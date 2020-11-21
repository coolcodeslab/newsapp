import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({this.content, this.imageUrl});
  final String content;
  static const id = 'news screen';
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: imageUrl == null
                  ? null
                  : DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                    ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 50,
                color: Colors.transparent,
              ),
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: height - 70.0,
                child: SingleChildScrollView(
                  child: Text(
                    content == null ? 'loading...' : content,
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            top: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
