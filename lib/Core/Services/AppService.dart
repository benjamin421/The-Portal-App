import 'dart:async';
import '../Helpers/Locator.dart';
import '../../Models/App.dart';
import '../Services/EpisodeService.dart';

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
