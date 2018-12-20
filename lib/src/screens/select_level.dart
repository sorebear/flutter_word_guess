import 'package:flutter/material.dart';
import 'level.dart';

class SelectLevel extends StatelessWidget {

  buildLevelTile(BuildContext context, String levelName, int levelNum, String secretWord) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
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
                  style: TextStyle(
                    color: Colors.pink[100]
                  )
                ),
                Text(
                  '$levelName',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  )
                ),
              ]
            ),
          ) 
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Level'),
      ),
      body: ListView(
        children: <Widget>[
          buildLevelTile(context, "Speckle Spackle", 1, "painter"),
          buildLevelTile(context, "Vanilla Twilight", 2, "galaxy"),
          buildLevelTile(context, "The Saltwater Room", 3, "seaside"),
          buildLevelTile(context, "Alligatory Sky", 4, "sky"),
        ],
      ),
    );
  }
}