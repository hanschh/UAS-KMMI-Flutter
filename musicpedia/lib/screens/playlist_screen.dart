import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_playlist_screen.dart';
import 'playlist_item_screen.dart';
import '../models/models.dart';
import 'playlist_list_screen.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<PlaylistManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaylistItemScreen(
                onCreate: (item) {
                  manager.addItem(item);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
      body: buildPlaylistScreen(),
    );
  }

  Widget buildPlaylistScreen() {
    return Consumer<PlaylistManager>(
      builder: (context, manager, child) {
        if (manager.playlistItems.isNotEmpty) {
          return PlaylistListScreen(manager: manager);
        } else {
          return const EmptyPlaylistScreen();
        }
      },
    );
  }
}
