import 'package:isar/isar.dart';

import '../../idea_rating_question/idea_rating_question.dart';
import '../../idea_rating_question/isar_idea_rating_question/isar_idea_rating_question_converter.dart';
import '../idea.dart';

part 'isar_idea.g.dart';

@Collection()
class IsarIdea {
  int id = Isar.autoIncrement;
  @Index(unique: true)
  late String uid;
  @Index(caseSensitive: false)
  late String title;
  @Index(caseSensitive: false)
  late String summary;
  @Index(caseSensitive: false)
  late String fullDescription;
  late String status;
  @Index()
  late double index;
  @Index()
  late int rating;
  @IsarIdeaRatingQuestionConverter()
  late List<IdeaRatingQuestion> ratingQuestions;
  @Index(caseSensitive: false)
  late List<String> categories;
  @Index()
  late DateTime dateTimeCreated;
  @Index()
  late DateTime dateTimeLastUpdated;

  IsarIdea();

  ///Isar has some drawbacks, so this is a duplicate model of Idea
  ///which handles Isar specifics (data mutability, int id)
  factory IsarIdea.fromIdea(Idea idea) => IsarIdea()
    ..uid = idea.uid
    ..title = idea.title
    ..summary = idea.summary
    ..fullDescription = idea.fullDescription
    ..status = idea.status
    ..index = idea.index
    ..rating = idea.rating
    ..ratingQuestions = idea.ratingQuestions
    ..categories = idea.categories
    ..dateTimeCreated = idea.dateTimeCreated
    ..dateTimeLastUpdated = idea.dateTimeLastUpdated;

  Idea toIdea() => Idea(
        uid: uid,
        title: title,
        summary: summary,
        fullDescription: fullDescription,
        status: status,
        index: index,
        rating: rating,
        ratingQuestions: ratingQuestions,
        categories: categories,
        dateTimeCreated: dateTimeCreated,
        dateTimeLastUpdated: dateTimeLastUpdated,
      );
}
