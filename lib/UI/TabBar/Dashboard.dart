import 'package:fiber/Networking/PortalEpisodeDataProvider.dart';
import 'package:fiber/UI/TabBar/BlogUpdateView.dart';
import 'package:flutter/cupertino.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //PortalEpisodeDataProvider dataProvider = PortalEpisodeDataProvider();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: BlogUpdate(),
          alignment: Alignment.topCenter,
        ),
        Center(
          //child: dataProvider.retrievePortalEpisodes,
        )
      ],
    );
  }
}
