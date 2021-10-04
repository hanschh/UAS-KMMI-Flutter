import 'package:flutter/material.dart';
import '../musicpedia_theme.dart';
import '../models/models.dart';

class Card1 extends StatelessWidget {
  final ExploreMusic music;

  const Card1({Key key, this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            Text(
              music.subtitle,
              style: MusicpediaTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
              child: Text(
                music.title,
                style: MusicpediaTheme.darkTextTheme.headline2,
              ),
              top: 20,
            ),
            Positioned(
              child: Text(
                music.message,
                style: MusicpediaTheme.darkTextTheme.bodyText1,
              ),
              bottom: 30,
              right: 0,
            ),
            Positioned(
              child: Text(
                music.authorName,
                style: MusicpediaTheme.darkTextTheme.bodyText1,
              ),
              bottom: 10,
              right: 0,
            )
          ],
        ),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(music.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
