import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/widgets/news_container.dart';

class HeadlinesScreen extends StatefulWidget {
  HeadlinesScreen({this.category});

  static const id = 'headline screen';
  final String category;

  @override
  _HeadlinesScreenState createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen> {
  ScrollController _scrollController = ScrollController();
  NewsModel newsModel = NewsModel();
  var newsData;
  List<String> headerList = [];
  List<String> newsList = [];
  List<String> imageList = [];

  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  void getNews() async {
    setState(() {
      loading = true;
    });
    newsData = await newsModel.getNews(category: widget.category);
    if (newsData != null) {
      for (int i = 0; i < 10; i++) {
        var title = newsData['articles'][i]['title'];
        var news = newsData['articles'][i]['content'];
        var imageUrl = newsData['articles'][i]['urlToImage'];

        headerList.add(title);
        newsList.add(news);
        imageList.add(imageUrl);
      }
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      widget.category,
                      style: kHeadingTextStyle,
                    ),
                    iconTheme: IconThemeData(
                      color: Color(0xff777777),
                    ),
                    pinned: false,
                    floating: true,
                    snap: true,
                    forceElevated: innerBoxIsScrolled,
                  )
                ];
              },
              body: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: (121 / 195),
                shrinkWrap: true,
                crossAxisSpacing: 20,
                padding: EdgeInsets.all(20),
                children: headerList
                    .map(
                      (item) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsScreen(
                                content: newsList[headerList.indexOf(item)],
                                imageUrl: imageList[headerList.indexOf(item)],
                              ),
                            ),
                          );
                        },
                        child: NewsContainer(
                          title: item,
                          url: imageList[headerList.indexOf(item)],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }
}
