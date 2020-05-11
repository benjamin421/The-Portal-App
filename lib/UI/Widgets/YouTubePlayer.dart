import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeCard extends StatefulWidget {
  final String url;
  YouTubeCard({Key key, this.url}) : super(key: key);

  @override
  _YouTubeCardState createState() => _YouTubeCardState();
}

class _YouTubeCardState extends State<YouTubeCard> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    String videoId = YoutubePlayer.convertUrlToId(widget.url);

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
      onReady: () {
        print('Player is ready.');
      },
    );
  }
}
