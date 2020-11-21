import 'package:flutter/material.dart';
import 'networking.dart';

class NewsModel {
  Future<dynamic> getNews({String category}) async {
    NetworkHelper networkHelper = NetworkHelper(
        "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=e4024844cf1d4f9eb3a478c28622c0a1");
    var newsData = await networkHelper.getData();
    return newsData;
  }
}
