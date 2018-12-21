import 'package:flutter/material.dart';
import '../widgets/level_tile.dart';
import '../data/level_data.dart';

class SelectLevel extends StatelessWidget {
  final List<LevelTile> levels = [];
  final BuildContext context;
  final levelSize;

  SelectLevel(this.context, this.levelSize) {
    for (int levelNum = 1; levelNum <= levelData[levelSize].length; levelNum += 1) {
      String levelName = levelData[levelSize][levelNum - 1]['name'];
      String secretWord = levelData[levelSize][levelNum - 1]['secretWord'];
      LevelTile levelTile = LevelTile(context, levelNum, levelName, secretWord);
      
      levels.add(levelTile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Level'),
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