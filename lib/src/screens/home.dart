import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('images/patterns/morocco-blue.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Word Guess',
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.grey[600],
                      offset: Offset(2.0, 2.0),
                      blurRadius: 1.0,
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Select Level'),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/select-size',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
