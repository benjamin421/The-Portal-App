import 'package:fiber/Models/PortalEpisode.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DataProvider {
  Future<List<PortalEpisode>> getEpisodes() async {
    List<PortalEpisode> episodes = [];
    final url = 'https://api.theportal.wiki/v1/podcasts';

    final response =
        await http.get(url, headers: {'Accept': 'application/json'});
    final responseData = json.decode(response.body);

    List<dynamic> eps = responseData['podcasts'];

    if (eps.length == 0) {
      return null;
    }
    eps.forEach((episode) {
      episodes.add(PortalEpisode.fromJson(episode));
    });
    print(eps);
    return episodes;
  }
}
