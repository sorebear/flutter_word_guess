import 'package:flutter/material.dart';

class LevelTile extends StatelessWidget {
  final String levelSize;
  final String levelNum;
  final String levelName;

  LevelTile(this.levelSize, this.levelNum, this.levelName);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/level/$levelSize/$levelNum');
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
                  'Level ${int.parse(levelNum)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
                Text(
                  levelName,
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