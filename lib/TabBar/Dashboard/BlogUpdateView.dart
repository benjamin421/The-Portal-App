
import 'package:fiber/Networking/DashboardItemDataProvider.dart';
import 'package:fiber/UI/TabBar/BlogWebView.dart';
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
  DashboardItemDataProvider dataProvider = DashboardItemDataProvider(
    "https://blog.theportal.wiki/feed/"
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DashboardItem>(
      future: dataProvider.retrieveBlogPosts(),
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogWebView(snapshot.data.url)
              )
            );
          },
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width - 30.0,
            height: (MediaQuery.of(context).size.width - 30) * 4 / 5,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new NetworkImage(
                  "https://images-na.ssl-images-amazon.com/images/I/51IYmW6WZ4L.jpg"
                ),
              ),
              borderRadius: BorderRadius.all(const Radius.circular(15.0))
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 15, bottom: 15.0),
                child: Text(
                  snapshot.data.title,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: "Raleway",
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          )
        );
      },
    );
  }
}