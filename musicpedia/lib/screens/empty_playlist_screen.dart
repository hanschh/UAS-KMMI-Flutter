import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyPlaylistScreen extends StatelessWidget {
  const EmptyPlaylistScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 1
    return Padding(
      padding: const EdgeInsets.all(30.0),
      // 2
      child: Center(
        // 3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/musicpedia_assets/empty_list.png'),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'No Playlist',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Looking for songs?\n'
              'Tap the + button to add playlist!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
              child: const Text('Browse Musics'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToMusics();
              },
            ),
          ],
        ),
      ),
    );
  }
}
