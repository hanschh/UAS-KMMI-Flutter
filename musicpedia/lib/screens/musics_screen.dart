import 'package:flutter/material.dart';
import '../api/mock_musicpedia_service.dart';
import '../components/components.dart';

class MusicsScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();

  MusicsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getMusics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MusicsGridView(musics: snapshot.data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
