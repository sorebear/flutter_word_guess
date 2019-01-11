import 'package:flutter/material.dart';
import 'levels_bloc.dart';
export 'levels_bloc.dart';

class LevelsProvider extends InheritedWidget {
  final LevelsBloc bloc = LevelsBloc();

  LevelsProvider({ Key key, Widget child })
    : super(key: key, child: child);
  
  bool updateShouldNotify(_) => true;

  static LevelsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LevelsProvider) as LevelsProvider).bloc;
  }
}