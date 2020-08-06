import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String text;

  const BlogCard({
    Key key,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width - 30.0,
      height: (MediaQuery.of(context).size.width - 30) * 4 / 5,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: new NetworkImage(
                "https://images-na.ssl-images-amazon.com/images/I/51IYmW6WZ4L.jpg"),
          ),
          borderRadius: BorderRadius.all(const Radius.circular(15.0))),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(left: 15, bottom: 15.0, right: 15.0),
          child: Text(
            text,
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: "Raleway",
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
