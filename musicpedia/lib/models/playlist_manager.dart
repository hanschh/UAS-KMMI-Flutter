import 'package:flutter/material.dart';
import 'playlist_item.dart';

class PlaylistManager extends ChangeNotifier {
  final _playlistItems = <PlaylistItem>[];
  List<PlaylistItem> get playlistItems => List.unmodifiable(_playlistItems);
  void deleteItem(int index) {
    _playlistItems.removeAt(index);
    notifyListeners();
  }

  void addItem(PlaylistItem item) {
    _playlistItems.add(item);
    notifyListeners();
  }

  void updateItem(PlaylistItem item, int index) {
    _playlistItems[index] = item;
    notifyListeners();
  }

  void completeItem(int index, bool change) {
    final item = _playlistItems[index];
    _playlistItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
