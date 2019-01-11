import 'package:flutter/material.dart';
import '../widgets/level_tile.dart';
import '../data/level_data.dart';

class SelectLevel extends StatelessWidget {
  final List<LevelTile> levels = [];
  final levelSize;

  SelectLevel(this.levelSize) {
    for (int levelNum = 1; levelNum <= levelData[levelSize].length; levelNum += 1) {
      String levelNumString = levelNum < 10 ? '00$levelNum' : levelNum < 100 ? '0$levelNum' : '$levelNum';
      String levelName = levelData[levelSize][levelNumString]['name'];
      LevelTile levelTile = LevelTile(levelSize, levelNumString, levelName);
      levels.add(levelTile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$levelSize Levels'),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('images/patterns/morocco.png'),
                repeat: ImageRepeat.repeat,
              ),
            )
          ),
          GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.all(12.0),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: levels,
          )
        ],
      )
    );
  }
}