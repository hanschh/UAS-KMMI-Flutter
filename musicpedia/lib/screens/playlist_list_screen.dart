import 'package:flutter/material.dart';
import '../components/playlist_tile.dart';
import '../models/models.dart';
import 'playlist_item_screen.dart';

class PlaylistListScreen extends StatelessWidget {
  final PlaylistManager manager;
  const PlaylistListScreen({Key key, this.manager}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final playlistItems = manager.playlistItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemCount: playlistItems.length,
          itemBuilder: (context, index) {
            final item = playlistItems[index];
            return Dismissible(
              key: Key(item.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              onDismissed: (direction) {
                manager.deleteItem(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} dismissed'),
                  ),
                );
              },
              child: InkWell(
                child: PlaylistTile(
                  key: Key(item.id),
                  item: item,
                  onComplete: (change) {
                    manager.completeItem(index, change);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistItemScreen(
                        originalItem: item,
                        onUpdate: (item) {
                          manager.updateItem(item, index);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16.0);
          }),
    );
  }
}
