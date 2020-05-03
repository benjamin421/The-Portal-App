import 'package:fiber/Networking/DashboardItemDataProvider.dart';
import 'package:fiber/UI/TabBar/BlogWebView.dart';
import 'package:fiber/UI/Widgets/BlogCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogUpdate extends StatefulWidget {
  @override
  _BlogUpdateState createState() {
    // TODO: implement createState
    return _BlogUpdateState();
  }
}

class _BlogUpdateState extends State<BlogUpdate> {
  DashboardItemDataProvider dataProvider =
      DashboardItemDataProvider("https://blog.theportal.wiki/feed/");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DashboardItem>(
      future: dataProvider.retrieveBlogPosts(),
      builder: (context, snapshot) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlogWebView(snapshot.data.url)));
            },
            child: BlogCard(
              text: snapshot.data.title,
            ));
      },
    );
  }
}
