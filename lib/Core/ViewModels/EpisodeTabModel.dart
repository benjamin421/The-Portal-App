import 'package:fiber/Core/Enums/ViewState.dart';
import 'package:fiber/Models/PortalEpisode.dart';
import 'package:fiber/Core/Services/EpisodeService.dart';

import 'package:fiber/Core/ViewModels/BaseModel.dart';
import 'package:fiber/Core/Helpers/Locator.dart';

class EpisodeTabModel extends BaseModel {
  final EpisodesService _episodesService = locator<EpisodesService>();

  List<PortalEpisode> episodes = [];

  String errorMessage;

  getEpisodes() async {
    setState(ViewState.Busy);

    List<PortalEpisode> eps = await _episodesService.getEpisodes();
    if (eps == null) {
      errorMessage = "No bookings fetched";
      setState(ViewState.Idle);
      return;
    }

    eps.forEach((ep) {
      episodes.add(ep);
    });

    setState(ViewState.Idle);
  }
}
