import 'package:flutter/material.dart';

import './data/level_data.dart';
import './screens/home.dart';
import './screens/level.dart';
import './screens/select_level.dart';
import './screens/select_size.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  final _levelDataObj = LevelData();

  _markLevelAsComplete(String levelSize, String levelNum) {
    setState(() {
      _levelDataObj.data[levelSize][levelNum]['completed'] = true;
    });
  }

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
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    } else if (settings.name.contains('/select-size')) {
      return MaterialPageRoute(builder: (BuildContext context) {
        return SelectSize(levelData: _levelDataObj.data);
      });
    } else if (settings.name.contains('/select-level/')) {
      String levelSize = settings.name.replaceFirst('/select-level/', '');
      return MaterialPageRoute(builder: (BuildContext context) {
        return SelectLevel(levelSize, levelData: _levelDataObj.data);
      });
    } else {
      List<String> sizeAndLevel =
          settings.name.replaceFirst('/level/', '').split('/');
      Map<String, dynamic> levelMap =
          _levelDataObj.data[sizeAndLevel[0]][sizeAndLevel[1]];
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return Level(
            levelName: levelMap['name'],
            levelNum: sizeAndLevel[1],
            secretWord: levelMap['secretWord'],
            markLevelAsComplete: _markLevelAsComplete,
          );
        },
      );
    }
  }
}
