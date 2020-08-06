import 'package:fiber/Core/Enums/view_state.dart';
import 'package:fiber/Models/portal_episode.dart';
import 'package:fiber/Core/Services/episode_service.dart';

import 'package:fiber/Core/ViewModels/base_model.dart';
import 'package:fiber/Core/Helpers/locator.dart';

class EpisodeTabModel extends BaseModel {
  final EpisodesService _episodesService = locator<EpisodesService>();

  List<PortalEpisode> episodes = [];

  String errorMessage;

  getEpisodes() async {
    setState(ViewState.Busy);

    List<PortalEpisode> eps = await _episodesService.getEpisodes();
    if (eps == null) {
      errorMessage = "No podcasts fetched";
      setState(ViewState.Idle);
      return;
    }

    eps.forEach((ep) {
      episodes.add(ep);
    });

    setState(ViewState.Idle);
  }
}
