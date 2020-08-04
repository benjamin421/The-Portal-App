import 'package:fiber/Core/Services/AuthService.dart';
import 'package:fiber/UI/Style.dart';
import 'package:fiber/UI/Widgets/ProfileAvatar.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../Core/Helpers/Functions.dart';
import '../../Shared/AppConstants.dart' as env;

class CommunityView extends StatefulWidget {
  static const routeName = '/profile';
  @override
  State<StatefulWidget> createState() {
    return _CommunityViewState();
  }
}

class _CommunityViewState extends State<CommunityView> {
  @override
  var authToken;
  var client;

  @override
  Widget build(BuildContext context) {
    return client != null
        ? GraphQLProvider(
            client: client,
            child: SafeArea(
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 16),
                      ProfileAvatar(
                          url:
                              "https://i.ytimg.com/vi/EAa6KueM2iM/maxresdefault.jpg"),
                      SizedBox(height: 16),
                      Text(
                        'Hello, you\'ve found The Portal',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 16.0),
                        child: Text(
                          'A podcast hosted by Eric Weinstein, The Portal is a journey of discovery. It is wide ranging and deep diving discussions with distinguished guests from the realms of science, culture and business. Join us as we seek portals that will carry us through the impossible- and beyond.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Divider(),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Subscribe',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Style.tabsColor,
                              fontSize: 14.0),
                        ),
                        onTap: () {
                          Functions.launchURL('https://ericweinstein.org/');
                        },
                      ),
                      Divider(),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Geometric Unity: A First Look',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Style.tabsColor,
                              fontSize: 14.0),
                        ),
                        onTap: () {
                          Functions.launchURL(
                              'https://www.youtube.com/watch?v=Z7rd04KzLcg&feature=youtu.be');
                        },
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          Functions.launchURL(
                              'https://projects.theportal.wiki/');
                        },
                        dense: true,
                        title: Text(
                          'Portal Projects',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Style.tabsColor,
                              fontSize: 14.0),
                        ),
                      ),
                      // ListTile(
                      //   onTap: () {
                      //     Functions.launchURL('https://ericweinstein.org/');
                      //   },
                      //   dense: true,
                      //   title: Text(
                      //     'Logout',
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.w600,
                      //         color: Style.tabsColor,
                      //         fontSize: 14.0),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ))
        : SafeArea(
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 16),
                    ProfileAvatar(
                        url:
                            "https://i.ytimg.com/vi/EAa6KueM2iM/maxresdefault.jpg"),
                    SizedBox(height: 16),
                    InkWell(
                      child: Text(
                        'Hello, you\'ve found The Portal',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 16.0),
                      child: Text(
                        'A podcast hosted by Eric Weinstein, The Portal is a journey of discovery. It is wide ranging and deep diving discussions with distinguished guests from the realms of science, culture and business. Join us as we seek portals that will carry us through the impossible- and beyond.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Subscribe',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Style.tabsColor,
                            fontSize: 14.0),
                      ),
                      onTap: () {
                        Functions.launchURL('https://ericweinstein.org/');
                      },
                    ),
                    Divider(),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Geometric Unity: A First Look',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Style.tabsColor,
                            fontSize: 14.0),
                      ),
                      onTap: () {
                        Functions.launchURL(
                            'https://www.youtube.com/watch?v=Z7rd04KzLcg&feature=youtu.be');
                      },
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        Functions.launchURL('https://projects.theportal.wiki/');
                      },
                      dense: true,
                      title: Text(
                        'Portal Projects',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Style.tabsColor,
                            fontSize: 14.0),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        setState(() {
                          authToken = AuthService.getToken();

                          client = AuthService.setClient(authToken);
                        });
                      },
                      dense: true,
                      title: Text(
                        'Try Auth',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Style.tabsColor,
                            fontSize: 14.0),
                      ),
                    ),
                    // ListTile(
                    //   onTap: () {
                    //     Functions.launchURL('https://ericweinstein.org/');
                    //   },
                    //   dense: true,
                    //   title: Text(
                    //     'Logout',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //         color: Style.tabsColor,
                    //         fontSize: 14.0),
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          );
  }
}
