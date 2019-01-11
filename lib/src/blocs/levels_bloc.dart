import 'package:rxdart/rxdart.dart';

class LevelsBloc {
  final _levelController = BehaviorSubject<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get levels => _levelController.stream;

  Function(Map<String, dynamic>) get updateLevelsBloc => _levelController.sink.add;

  dispose() {
    _levelController.close();
  }
}