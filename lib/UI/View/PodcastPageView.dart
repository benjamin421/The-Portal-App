import 'package:fiber/UI/Widgets/YouTubePlayer.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Models/PortalEpisode.dart';
import '../Style.dart';
import '../../Core/Helpers/Functions.dart';

class PodcastPageView extends StatelessWidget {
  static const routeName = '/profile';
  final PortalEpisode episode;

  PodcastPageView({
    this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SizedBox(
            height: 48,
            child: FlatButton(
              onPressed: () {
                Functions.launchURL('https://ericweinstein.org/');
              },
              child: Text(
                'Subscribe',
                style: TextStyle(color: Style.tabsColor),
              ),
              color: Style.primaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Row(
                children: <Widget>[
                  BackButton(),
                  Text(
                    'Episode ${episode.number}',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(),
                  child: //Image.network(episode.data.PicUrl,
                      // fit: BoxFit.cover),
                      episode.links.youtube != ''
                          ? YouTubeCard(
                              url: episode.links.youtube,
                            )
                          : Image.asset(
                              'assets/theportal.jpeg',
                              fit: BoxFit.cover,
                            ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 4.0,
                            ),
                            Flexible(
                              child: Text(
                                '${episode.date?.month.toString()}/${episode.date.day.toString()}/${episode.date.year.toString()}',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  episode.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                            ]),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Divider(),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Podcast description'),
            ),
            SizedBox(
              height: 32.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'More about The Portal',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Container(
                  child: Text(
                      'A podcast hosted by Eric Weinstein, The Portal is a journey of discovery. It is wide ranging and deep diving discussions with distinguished guests from the realms of science, culture and business. Join us as we seek portals that will carry us through the impossible- and beyond.',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black))),
            ),
            SizedBox(
              height: 16.0,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
