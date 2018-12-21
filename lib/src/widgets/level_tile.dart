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
    Color primaryColor = Theme.of(context).primaryColor;

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
              color: primaryColor,
              width: 3.0,
            ),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Level ${levelNum.toString()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
                Text(
                  '$levelName',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 12.0,
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