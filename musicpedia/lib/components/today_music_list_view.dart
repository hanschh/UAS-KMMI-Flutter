import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class TodayMusicListView extends StatelessWidget {
  final List<ExploreMusic> musics;

  const TodayMusicListView({Key key, this.musics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Songs of the Week 🎼',
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          Container(
              height: 400,
              color: Colors.transparent,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: musics.length,
                  itemBuilder: (context, index) {
                    final music = musics[index];
                    return buildCard(music);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  })),
        ]));
  }

  Widget buildCard(ExploreMusic music) {
    if (music.cardType == MusicCardType.card1) {
      return Card1(music: music);
    } else if (music.cardType == MusicCardType.card2) {
      return Card2(music: music);
    } else if (music.cardType == MusicCardType.card3) {
      return Card3(music: music);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
