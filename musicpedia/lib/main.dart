import 'package:flutter/material.dart';
import 'musicpedia_theme.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

void main() {
  runApp(const Musicpedia());
}

class Musicpedia extends StatelessWidget {
  const Musicpedia({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = MusicpediaTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musicpedia',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TabManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => PlaylistManager(),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}
