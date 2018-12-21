import 'package:flutter/material.dart';
import '../screens/level.dart';

class LevelTile extends StatelessWidget {
  final BuildContext context;
  final int levelNum;
  final String levelName;
  final String secretWord;

  LevelTile(this.context, this.levelNum, this.levelName, this.secretWord);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Level(levelName, levelNum, secretWord)),
          );
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Colors.grey[300],
              width: 2.0,
            ),
            color: Colors.pink,
          ),
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Level ${levelNum.toString()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.pink[100]
                  )
                ),
                Text(
                  '$levelName',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  )
                ),
              ]
            ),
          ) 
        )
      ),
    );
  }
}