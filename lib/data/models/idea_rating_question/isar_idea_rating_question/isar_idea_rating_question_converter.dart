import 'dart:convert';

import 'package:isar/isar.dart';

import '../idea_rating_question.dart';

class IsarIdeaRatingQuestionConverter extends TypeConverter<List<IdeaRatingQuestion>, String> {
  const IsarIdeaRatingQuestionConverter();

  @override
  List<IdeaRatingQuestion> fromIsar(String object) {
    List<dynamic> decodedList = jsonDecode(object);
    List<IdeaRatingQuestion> unmappedList = decodedList
        .map(
          (question) => IdeaRatingQuestion.fromJson(question),
        )
        .toList();
    return unmappedList;
  }

  @override
  String toIsar(List<IdeaRatingQuestion> object) {
    final mappedList = object
        .map(
          (question) => question.toJson(),
        )
        .toList();
    return jsonEncode(mappedList);
  }
}
