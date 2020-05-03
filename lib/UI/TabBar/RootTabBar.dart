import 'package:fiber/UI/TabBar/Dashboard.dart';
import 'package:fiber/UI/TabBar/PodcastListView.dart';
import 'package:fiber/UI/TabBar/ProfileView.dart';
import 'package:fiber/UI/Widgets/TabItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Style.dart';

class RootTabBar extends StatefulWidget {
  @override
  _RootTabBarState createState() => _RootTabBarState();
}

class _RootTabBarState extends State<RootTabBar> {
  List<Widget> tabViews = [
    PodcastListView(),
    PodcastListView(),
    PodcastListView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('FIBER', style: Style.screenTitleStyle),
              Visibility(
                visible: true,
                child: Text('A PORTAL APP', style: Style.screenSubtitleStyle),
              )
            ],
          ),
          backgroundColor: Style.backgroungColor,
        ),
        bottomSheet: TabBar(
          tabs: <Widget>[
            TabItem(
              text: 'HOME',
              icon: Icon(
                Icons.home,
                color: tabsColor,
              ),
            ),
            TabItem(
              text: 'PORTAL',
              icon: Icon(
                Icons.crop_portrait,
                color: tabsColor,
              ),
            ),
            TabItem(
              text: 'LIBRARY',
              icon: Icon(
                Icons.library_books,
                color: tabsColor,
              ),
            ),
            TabItem(
              text: 'INFO',
              icon: Icon(
                Icons.info,
                color: tabsColor,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: tabViews,
        ),
      ),
    );
  }
}
