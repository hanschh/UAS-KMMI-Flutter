import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicsGridView extends StatelessWidget {
  final List<SimpleMusic> musics;

  const MusicsGridView({Key key, this.musics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: GridView.builder(
            itemCount: musics.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 1500.0),
            itemBuilder: (context, index) {
              final simpleMusic = musics[index];
              return GestureDetector(
                onTap: ()async{ await launch(musics[index].links);},
                child:MusicThumbnail(music: simpleMusic)
              );
              }
            )
          );
  }
}

