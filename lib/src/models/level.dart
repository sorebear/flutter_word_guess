class LevelModel {
  final String id;
  final String name;
  final String secretWord;
  final String lengthString;
  final int length;
  final bool completed;

  LevelModel.fromJson(Map<String, dynamic> parsedJson) :
    id = parsedJson['id'],
    name = parsedJson['name'],
    secretWord = parsedJson['secretWord'],
    lengthString = parsedJson['lengthString'],
    length = parsedJson['length'],
    completed = parsedJson['completed'];

  
  LevelModel.fromDb(Map<String, dynamic> parsedJson) :
    id = parsedJson['id'],
    name = parsedJson['name'],
    secretWord = parsedJson['secretWord'],
    lengthString = parsedJson['lengthString'],
    length = parsedJson['length'],
    completed = parsedJson['completed'] == 1;
  
  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "secretWord": secretWord,
      "lengthString": lengthString,
      "length": length,
      "completed": completed ? 1 : 0
    };
  }
}