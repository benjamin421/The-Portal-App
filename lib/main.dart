import 'package:fiber/Core/Helpers/dialog_manger.dart';
import 'package:fiber/Models/portal_episode.dart';
import 'package:fiber/Models/wp_blog.dart';
import 'package:fiber/router.dart';
import 'package:flutter/material.dart';
import 'Core/Helpers/locator.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fiber/Core/Services/episode_service.dart';
import 'package:fiber/Core/Services/portal_blog_service.dart';

import 'package:fiber/Core/Services/navigation_service.dart';

import 'package:fiber/Core/Helpers/get_adaptive_theme.dart';

void main() async {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  //MapView.setApiKey(apiKey);

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xffeaff68),
  ));

  setupLocator();

  runApp(ThePortal());
}

class ThePortal extends StatefulWidget {
  ThePortal({Key key}) : super(key: key);

  @override
  _ThePortalAppState createState() => _ThePortalAppState();
}

class _ThePortalAppState extends State<ThePortal> {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<PortalEpisode>>(
          initialData: <PortalEpisode>[],
          create: (_) => locator<EpisodesService>().episodesController.stream,
        ),
        StreamProvider<List<WpBlog>>(
          initialData: <WpBlog>[],
          create: (_) => locator<PortalBlogService>().blogsController.stream,
        ),
      ],
      child: MaterialApp(
        theme: getAdaptiveTheme(context),
        initialRoute: refreshRoute,
        builder: (context, widget) {
          return Navigator(
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => DialogManager(
                      child: widget,
                    )),
          );
        },
        onGenerateRoute: Router.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
