import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import '../idea_rating_question/idea_rating_question.dart';
import '../idea_rating_question/idea_rating_question_converter.dart';

part 'idea.g.dart';

@Collection()
class Idea extends Equatable {
  final int id;
  @Index(caseSensitive: false)
  final String title;
  @Index(caseSensitive: false)
  final String summary;
  @Index(caseSensitive: false)
  final String fullDescription;
  final String status;
  @Index()
  final double index;
  @Index()
  final int rating;
  @IdeaRatingQuestionConverter()
  final List<IdeaRatingQuestion> ratingQuestions;
  @Index(caseSensitive: false)
  final List<String> categories;
  @Index()
  final DateTime dateTimeCreated;
  @Index()
  final DateTime dateTimeLastUpdated;

  const Idea({
    required this.id,
    required this.title,
    required this.summary,
    required this.fullDescription,
    required this.status,
    required this.index,
    required this.rating,
    required this.ratingQuestions,
    required this.categories,
    required this.dateTimeCreated,
    required this.dateTimeLastUpdated,
  });

  @override
  String toString() => 'Idea{ id: $id, title: $title, summary: $summary, '
      'fullDescription: $fullDescription, status: $status, index: $index, '
      'rating: $rating, ratingQuestions: $ratingQuestions, categories: $categories, '
      'dateTimeCreated: $dateTimeCreated, dateTimeLastUpdated: $dateTimeLastUpdated,}';

  Idea copyWith({
    int? id,
    String? title,
    String? summary,
    String? fullDescription,
    String? status,
    double? index,
    int? rating,
    List<IdeaRatingQuestion>? ratingQuestions,
    List<String>? categories,
    DateTime? dateTimeCreated,
    DateTime? dateTimeLastUpdated,
  }) =>
      Idea(
        id: id ?? this.id,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        fullDescription: fullDescription ?? this.fullDescription,
        status: status ?? this.status,
        index: index ?? this.index,
        rating: rating ?? this.rating,
        ratingQuestions: ratingQuestions ?? this.ratingQuestions,
        categories: categories ?? this.categories,
        dateTimeCreated: dateTimeCreated ?? this.dateTimeCreated,
        dateTimeLastUpdated: dateTimeLastUpdated ?? this.dateTimeLastUpdated,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'summary': summary,
        'fullDescription': fullDescription,
        'status': status,
        'index': index,
        'rating': rating,
        'ratingQuestions': ratingQuestions.map((question) => question.toJson()).toList(),
        'categories': categories,
        'dateTimeCreated': dateTimeCreated,
        'dateTimeLastUpdated': dateTimeLastUpdated,
      };

  factory Idea.fromJson(Map<String, dynamic> json) => Idea(
        id: json['id'] as int? ?? 0,
        title: json['title'] as String? ?? '',
        summary: json['summary'] as String? ?? '',
        fullDescription: json['fullDescription'] as String? ?? '',
        status: json['status'] as String? ?? '',
        index: json['index'] as double? ?? 0,
        rating: json['rating'] as int? ?? 0,
        ratingQuestions: (json['ratingQuestions'] is List)
            ? (json['ratingQuestions'] as List)
                .map(
                  (q) => IdeaRatingQuestion.fromJson(q),
                )
                .toList()
            : <IdeaRatingQuestion>[],
        categories: json['categories'] as List<String>? ?? <String>[],
        dateTimeCreated: json['dateTimeCreated'] as DateTime? ?? DateTime.now(),
        dateTimeLastUpdated: json['dateTimeLastUpdated'] as DateTime? ?? DateTime.now(),
      );

  @override
  List<Object?> get props => [
        id,
        title,
        summary,
        fullDescription,
        status,
        index,
        rating,
        ratingQuestions,
        categories,
        dateTimeCreated,
        dateTimeLastUpdated,
      ];
}
