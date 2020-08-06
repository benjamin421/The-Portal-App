import 'package:flutter/material.dart';
import '../Style.dart';

class TabItem extends StatelessWidget {
  final String text;
  final Widget icon;

  const TabItem({
    Key key,
    @required this.text,
    @required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Tab(
      
      icon: icon,
      child: Text(
        text,
        style: TextStyle(fontFamily: 'Raleway', color: Style.tabsColor),
      ),
    );
  }
}
