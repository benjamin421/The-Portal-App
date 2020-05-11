import 'package:fiber/Core/ViewModels/EpisodeTabModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fiber/Core/Enums/ViewState.dart';
import 'package:fiber/Models/PortalEpisode.dart';

import 'package:fiber/UI/Widgets/EpisodesList.dart';
import 'package:fiber/UI/View/BaseView.dart';

class PodcastListView extends StatefulWidget {
  static const routeName = '/profile';
  @override
  State<StatefulWidget> createState() {
    return _PodcastListViewState();
  }
}

class _PodcastListViewState extends State<PodcastListView> {
  ScrollController pageScrollController;

  @override
  void initState() {
    pageScrollController = ScrollController(
      initialScrollOffset: 0.0,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<EpisodeTabModel>(
      onModelReady: (model) async {
        if (Provider.of<List<PortalEpisode>>(context).length == 0)
          model.getEpisodes();
      },
      builder: (context, model, child) => SafeArea(
        child: Stack(
          children: <Widget>[
            RefreshIndicator(
              onRefresh: () async => await model.getEpisodes(),
              child: ListView(
                physics: ClampingScrollPhysics(),
                controller: pageScrollController,
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 32),
                    child: Text(
                      'Episodes',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
                    child: Container(
                      child: model.viewState == ViewState.Busy
                          ? CircularProgressIndicator()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                // const Divider(),
                                EpisodeList(
                                  episodes:
                                      Provider.of<List<PortalEpisode>>(context)
                                          .toList(),
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
