import 'package:flutter/material.dart';
import '../data/level_data.dart';
import '../widgets/size_tile.dart';

class SelectSize extends StatelessWidget {
  final List<SizeTile> levelSizes = [];

  SelectSize(BuildContext context) {
    levelData.forEach((size, levels) {
      SizeTile sizeTile = SizeTile(context, size);
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
            )
          ),
          GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(12.0),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: levelSizes,
          ),
        ],
      )
    );
  }
}