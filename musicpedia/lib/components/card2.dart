import 'package:flutter/material.dart';
import '../models/models.dart';

import '../musicpedia_theme.dart';
import 'author_card.dart';

class Card2 extends StatelessWidget {
  final ExploreMusic music;

  const Card2({Key key, this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(music.backgroundImage), fit: BoxFit.cover),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          children: [
            AuthorCard(
                authorName: music.authorName,
                title: music.role,
                imageProvider: AssetImage(music.profileImage)),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      music.title,
                      style: MusicpediaTheme.lightTextTheme.headline1,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        music.subtitle,
                        style: MusicpediaTheme.lightTextTheme.headline1,
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
