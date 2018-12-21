import 'package:flutter/material.dart';
import '../screens/select_level.dart';

class SizeTile extends StatelessWidget {
  final BuildContext context;
  final String levelSize;

  SizeTile(this.context, this.levelSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectLevel(context, levelSize)),
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
                  '$levelSize',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
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