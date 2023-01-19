import 'package:isar/isar.dart';

import '../../idea_rating_question/idea_rating_question.dart';
import '../../idea_rating_question/isar_idea_rating_question/isar_idea_rating_question_converter.dart';
import '../../task/isar_task/isar_task_converter.dart';
import '../../task/task.dart';
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
  late String revenueExplanation;
  late String differentiationExplanation;
  late String speedExplanation;
  late String capitalExplanation;
  @Index()
  late double index;
  @Index()
  late int rating;
  @IsarIdeaRatingQuestionConverter()
  late List<IdeaRatingQuestion> ratingQuestions;
  @Index(caseSensitive: false)
  late List<String> categories;

  ///Tasks is added in newer version of app, i.e. there are some users who have old data
  ///without tasks field so we have to check it for nullability and assign an empty list
  @IsarTaskConverter()
  List<Task>? tasks;
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
    ..revenueExplanation = idea.revenueExplanation
    ..differentiationExplanation = idea.differentiationExplanation
    ..speedExplanation = idea.speedExplanation
    ..capitalExplanation = idea.capitalExplanation
    ..index = idea.index
    ..rating = idea.rating
    ..ratingQuestions = idea.ratingQuestions
    ..categories = idea.categories
    ..tasks = idea.tasks
    ..dateTimeCreated = idea.dateTimeCreated
    ..dateTimeLastUpdated = idea.dateTimeLastUpdated;

  Idea toIdea() => Idea(
        uid: uid,
        title: title,
        summary: summary,
        fullDescription: fullDescription,
        status: status,
        revenueExplanation: revenueExplanation,
        differentiationExplanation: differentiationExplanation,
        speedExplanation: speedExplanation,
        capitalExplanation: capitalExplanation,
        index: index,
        rating: rating,
        ratingQuestions: ratingQuestions,
        categories: categories,
        tasks: tasks ?? <Task>[],
        dateTimeCreated: dateTimeCreated,
        dateTimeLastUpdated: dateTimeLastUpdated,
      );
}
