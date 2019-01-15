import 'package:flutter/material.dart';
import '../widgets/size_tile.dart';

class SelectSize extends StatelessWidget {
  final levelData;
  final List<SizeTile> levelSizes = [];

  SelectSize({this.levelData}) {
    levelData.forEach((size, levels) {
      SizeTile sizeTile = SizeTile(size);
      levelSizes.add(sizeTile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Size'),
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
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: levelSizes,
          ),
        ],
      ),
    );
  }
}
