import 'dart:async';
import '../Helpers/locator.dart';
import '../../Models/app.dart';
import 'episode_service.dart';

class AppService {
  StreamController<App> appController = StreamController<App>.broadcast();

  final _episodesService = locator<EpisodesService>();

  App app = App();

  AppService() {
    appController.add(app);
  }

  changeIndex(int value) async {
    if (app.navigationIndex != value) {
      app.navigationIndex = value;
      appController.add(app);
    }
  }

  clearStreams() async {
    _episodesService.clearEpisodes();
  }
}
