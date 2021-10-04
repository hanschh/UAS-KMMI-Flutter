import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

// Mock music service that grabs sample json data to mock music request/response
class MockFooderlichService {
  // Batch request that gets both today musics and friend's feed
  Future<ExploreData> getExploreData() async {
    final todayMusics = await _getTodayMusics();
    final friendPosts = await _getFriendFeed();

    return ExploreData(todayMusics, friendPosts);
  }

  // Get sample explore Musics json to display in ui
  Future<List<ExploreMusic>> _getTodayMusics() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_explore_musics.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each music and convert json to ExploreMusic object.
    if (json['musics'] != null) {
      final musics = <ExploreMusic>[];
      json['musics'].forEach((v) {
        musics.add(ExploreMusic.fromJson(v));
      });
      return musics;
    } else {
      return [];
    }
  }

  // Get the sample friend json posts to display in ui
  Future<List<Post>> _getFriendFeed() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_friends_feed.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each post and convert json to Post object.
    if (json['feed'] != null) {
      final posts = <Post>[];
      json['feed'].forEach((v) {
        posts.add(Post.fromJson(v));
      });
      return posts;
    } else {
      return [];
    }
  }

  // Get the sample music json to display in ui
  Future<List<SimpleMusic>> getMusics() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_musics.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each music and convert json to SimpleMusic object.
    if (json['musics'] != null) {
      final musics = <SimpleMusic>[];
      json['musics'].forEach((v) {
        musics.add(SimpleMusic.fromJson(v));
      });
      return musics;
    } else {
      return [];
    }
  }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
