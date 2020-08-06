import 'package:fiber/Models/portal_episode.dart';
import 'package:flutter/cupertino.dart';

class PortalDashboardCard extends StatelessWidget {
  PortalEpisode episode;

  PortalDashboardCard(PortalEpisode episode) {
    this.episode = episode;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/theportal.jpeg'),
              //image: new NetworkImage(
              // episode.imageURL
              // ),
            ),
            borderRadius: BorderRadius.all(const Radius.circular(15.0))),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 15, bottom: 15.0, right: 15.0),
                child: Text(
                  episode.title,
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: "Raleway",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                episode.number.toString(),
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: "Raleway",
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ));
  }
}
