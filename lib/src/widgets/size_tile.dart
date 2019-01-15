import 'package:flutter/material.dart';

class SizeTile extends StatelessWidget {
  final String levelSize;

  SizeTile(this.levelSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/select-level/$levelSize');
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.pink,
          ),
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$levelSize Words',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
