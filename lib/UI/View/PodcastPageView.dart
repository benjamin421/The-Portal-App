import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/PortalEpisode.dart';
import '../Style.dart';

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
              onPressed: () {},
              child: Text(
                'Call to Action',
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(),
                      child: //Image.network(episode.data.PicUrl,
                          // fit: BoxFit.cover),
                          Image.asset(
                        'assets/peter.png',
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
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
              //'As the founder of Wand, I thought that it was important that I experience the platform first had, that\'s why, for a limited run, I\'ll be available for bookings in the St. Louis area to not only insure quality from the top down, but also to learn how to iterate and improve Wand while taking my first salary from the company. I would warn however, if it\'s a quality service you\'re looking for, I\'d recommend searching and giving the business to one of our many other talented cleaning professionals on the platform. Thanks for using Wand!'),
            ),
            SizedBox(
              height: 32.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Links or Projects?',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Divider(),
            SizedBox(height: 16.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 3,
                  ),
                  Text('This is where links will go?',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black))
                ],
              ),
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
