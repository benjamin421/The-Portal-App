import 'package:fiber/UI/TabBar/Dashboard.dart';
import 'package:fiber/UI/TabBar/PodcastListView.dart';
import 'package:fiber/UI/TabBar/PortalBlogsView.dart';
import 'package:fiber/UI/TabBar/ProfileView.dart';
import 'package:fiber/UI/Widgets/TabItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../TabBar/Dashboard/BlogUpdateView.dart';
import '../Style.dart';

class RootTabBar extends StatefulWidget {
  @override
  _RootTabBarState createState() => _RootTabBarState();
}

class _RootTabBarState extends State<RootTabBar> {
  List<Widget> tabViews = [
    PodcastListView(),
    PortalBlogTab(),
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
              Text('THE PORTAL', style: Style.screenTitleStyle),
              Visibility(
                visible: true,
                child: Text('OFFICIAL APP', style: Style.screenSubtitleStyle),
              )
            ],
          ),
          backgroundColor: Style.backgroungColor,
        ),
        bottomSheet: TabBar(
          indicatorColor: Style.primaryColor,
          unselectedLabelColor: Colors.redAccent,
          indicator: ShapeDecoration(
              color: Style.primaryColor,
              shape: BeveledRectangleBorder(side: BorderSide())),
          tabs: <Widget>[
            TabItem(
              text: 'PODCAST',
              icon: Icon(
                Icons.rss_feed,
                color: tabsColor,
              ),
            ),
            TabItem(
              text: 'BLOG',
              icon: Icon(
                Icons.crop_portrait,
                color: tabsColor,
              ),
            ),
            TabItem(
              text: 'TRIBE',
              icon: Icon(
                Icons.group,
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
