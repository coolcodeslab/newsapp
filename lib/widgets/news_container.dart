import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  NewsContainer({this.title, this.onTap, this.url});

  final String title;
  final Function onTap;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: url == null
                  ? null
                  : DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            padding: EdgeInsets.all(15),
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Text(
//                  title,
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 20),
//                  maxLines: 4,
//                ),
//              ],
//            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  maxLines: 4,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
