import 'package:fiber/Core/Helpers/DialogManager.dart';
import 'package:fiber/Models/PortalEpisode.dart';
import 'package:fiber/Models/WPBlog.dart';
import 'package:fiber/Router.dart';
import 'package:flutter/material.dart';
import 'Core/Helpers/Locator.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fiber/Core/Services/EpisodeService.dart';
import 'package:fiber/Core/Services/PortalBlogService.dart';

import 'package:fiber/Core/Services/NavigationService.dart';
import 'package:fiber/Core/Services/AppService.dart';

import 'package:fiber/Core/Helpers/GetAdaptiveTheme.dart';

import 'package:fiber/Models/App.dart';

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

  runApp(Fiber());
}

class Fiber extends StatefulWidget {
  Fiber({Key key}) : super(key: key);

  @override
  _FiberAppState createState() => _FiberAppState();
}

class _FiberAppState extends State<Fiber> {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<App>(
          initialData: App()..tokenExpired = false,
          create: (context) => locator<AppService>().appController.stream,
          updateShouldNotify: (oldApp, newApp) {
            return oldApp == newApp;
          },
        ),
        StreamProvider<List<PortalEpisode>>(
          initialData: <PortalEpisode>[],
          create: (_) => locator<EpisodesService>().episodesController.stream,
        ),
        StreamProvider<List<WpBlog>>(
          initialData: <WpBlog>[],
          create: (_) => locator<PortalBlogService>().blogsController.stream,
        ),
      ],
      child: Consumer<App>(
        builder: (context, model, child) => MaterialApp(
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
      ),
    );
  }
}
