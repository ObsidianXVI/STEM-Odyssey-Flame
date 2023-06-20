import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';

const double tileSize = 48;

class STEMOdyssey extends FlameGame {
  late TiledComponent mapComponent;

  @override
  Future<void> onLoad() async {
    mapComponent =
        await TiledComponent.load('Lab.tmx', Vector2.all(tileSize * 2));
    add(mapComponent);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  imageCache.clear();
  runApp(const OdysseyApp());
}

class OdysseyApp extends StatelessWidget {
  const OdysseyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STEM Odyssey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/game',
      routes: {
        '/game': (context) => GameWidget(game: STEMOdyssey()),
      },
    );
  }
}
