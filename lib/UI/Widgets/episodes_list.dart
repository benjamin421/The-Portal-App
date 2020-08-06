import 'package:fiber/Models/portal_episode.dart';
import 'package:fiber/UI/Widgets/portal_episode_card.dart';
import 'package:flutter/material.dart';

class EpisodeList extends StatelessWidget {
  final List<PortalEpisode> episodes;

  const EpisodeList({Key key, this.episodes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return episodes == null || episodes.length == 0
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Text('Portal Podcast Episodes will appear here.')
            ],
          )
        : Column(
            children: <Widget>[
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: episodes.length,
                itemBuilder: (context, index) =>
                    PortalEpisodeCard(episodes[index]),
                separatorBuilder: (context, index) => Divider(),
              ),
            ],
          );
  }
}
