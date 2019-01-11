import 'package:flutter/material.dart';

import './data/level_data.dart';
import './screens/home.dart';
import './screens/level.dart';
import './screens/select_level.dart';
import './screens/select_size.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Guess',
      theme: ThemeData(
        fontFamily: 'NovaMono',
        primaryColor: Color.fromARGB(255, 74, 175, 198),
      ),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      print('[Home Route] ' + settings.name);
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return Home();
        }
      );
    } else if (settings.name.contains('/select-size')) {
      print('[Select Size Route] ' + settings.name);
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return SelectSize(context);
        }
      );
    } else if (settings.name.contains('/select-level/')) {
      print('[Select Level Route] ' + settings.name);
      String levelSize = settings.name.replaceFirst('/select-level/', '');
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return SelectLevel(levelSize);
        }
      );
    } else {
      List<String> sizeAndLevel = settings.name.replaceFirst('/level/', '').split('/');
      Map<String, dynamic> levelMap = levelData[sizeAndLevel[0]][sizeAndLevel[1]];
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return Level(levelMap['name'], sizeAndLevel[1], levelMap['secretWord']);
        }
      );
    }
  }
}