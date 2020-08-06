import 'dart:async';
import 'package:fiber/Core/Services/api_service.dart';

import 'package:fiber/Core/Helpers/locator.dart';
import 'package:fiber/Models/portal_episode.dart';



class EpisodesService {
  DataProvider _dataProvider = locator<DataProvider>();

  StreamController<List<PortalEpisode>> episodesController =
      StreamController.broadcast();

  clearEpisodes() {
    List<PortalEpisode> episodes = List<PortalEpisode>();
    episodesController.add(episodes);
    print("clear");
  }

  Future<List<PortalEpisode>> getEpisodes() async {
    List<PortalEpisode> episodes = await _dataProvider.getEpisodes();
    if (episodes != null) {
      episodesController.add(episodes);
    }
    return episodes;
  }
}
