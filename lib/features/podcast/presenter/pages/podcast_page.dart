import 'package:flutter/material.dart';

import '../../../../core/widgets/responsive_list.dart';
import '../../../../shared/widgets/loading.dart';
import '../../domain/entities/episode.dart';
import '../controller/podcast_controller.dart';
import '../widgets/episode_card.dart';

class PodcastPage extends StatefulWidget {
  PodcastPage({Key key}) : super(key: key);

  @override
  _PodcastPageState createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  final PodcastController _pageController = PodcastController();

  @override
  void initState() {
    super.initState();
    _pageController.getListEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Episode>>(
      valueListenable: _pageController.episodesList,
      builder: (context, value, child) {
        return LoadingWidget(
          loading: _pageController.loading,
          widget: ResponsiveList(
            title: 'Episodes',
            list: value
                .map((episodeItem) => EpisodeCard(
                      episodeItem: episodeItem,
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
