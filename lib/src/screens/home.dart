import 'package:flutter/material.dart';
import './select_level.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Word Guess',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.teal
              )
            ),
            RaisedButton(
              child: Text('Select Level'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectLevel())
                );
              } 
            )
          ],
        )
      ) 
    );
  }
}