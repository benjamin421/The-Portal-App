import 'package:flutter/material.dart';
import '../../Models/PortalEpisode.dart';

class PortalEpisodeCard extends StatefulWidget {
  //EpisodeList({Key key}) : super(key: key);
  final PortalEpisode episode;
  PortalEpisodeCard(this.episode);

  @override
  _EpisodeListState createState() => _EpisodeListState();
}

class _EpisodeListState extends State<PortalEpisodeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(),
                child: //widget.episode.imageURL != null
                    //? Image.network(widget.episode.imageURL, fit: BoxFit.cover)
                    // :
                    Image.asset(
                  'assets/theportal.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.episode.title ?? "",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Episode ${widget.episode.number}' ?? "",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '${widget.episode.date?.month.toString()}/${widget.episode.date.day.toString()}/${widget.episode.date.year.toString()}',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
