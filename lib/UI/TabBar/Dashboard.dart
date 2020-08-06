import 'package:fiber/Networking/portal_episode_data_provider.dart';
import 'package:fiber/UI/TabBar/blog_update_view.dart';
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
