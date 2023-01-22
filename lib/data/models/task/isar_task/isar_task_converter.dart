import 'dart:convert';

import 'package:isar/isar.dart';

import '../task.dart';

class IsarTaskConverter extends TypeConverter<List<Task>?, String> {
  const IsarTaskConverter();

  @override
  List<Task> fromIsar(String? object) {
    ///Tasks is added in newer version of app, i.e. there are some users who have old data
    ///without tasks field so we have to check it for nullability and assign an empty list
    if (object != null && object.isNotEmpty) {
      List<dynamic> decodedList = jsonDecode(object);
      List<Task> unmappedList = decodedList
          .map(
            (task) => Task.fromJsonEncoded(task),
          )
          .toList();
      return unmappedList;
    } else {
      return <Task>[];
    }
  }

  @override
  String toIsar(List<Task>? object) {
    final mappedList = object
        ?.map(
          (task) => task.toJsonEncode(),
        )
        .toList();
    return jsonEncode(mappedList);
  }
}
