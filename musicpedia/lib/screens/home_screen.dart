import 'package:flutter/material.dart';
import '../api/mock_musicpedia_service.dart';
import '../components/components.dart';

class HomeScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(scrollDirection: Axis.vertical, children: [
              TodayMusicListView(musics: snapshot.data.todayMusics),
              const SizedBox(height: 16),
              FriendPostListView(friendPosts: snapshot.data.friendPosts)
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
