import 'package:equatable/equatable.dart';

import '../idea_rating_question/idea_rating_question.dart';

class Idea extends Equatable {
  final String uid;
  final String title;
  final String summary;
  final String fullDescription;
  final String status;
  final double index;
  final int rating;
  final List<IdeaRatingQuestion> ratingQuestions;
  final List<String> categories;
  final DateTime dateTimeCreated;
  final DateTime dateTimeLastUpdated;

  const Idea({
    required this.uid,
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
  String toString() => 'Idea{ uid: $uid, title: $title, summary: $summary, '
      'fullDescription: $fullDescription, status: $status, index: $index, '
      'rating: $rating, ratingQuestions: $ratingQuestions, categories: $categories, '
      'dateTimeCreated: $dateTimeCreated, dateTimeLastUpdated: $dateTimeLastUpdated,}';

  Idea copyWith({
    String? uid,
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
        uid: uid ?? this.uid,
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
        'uid': uid,
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
        uid: json['uid'] as String? ?? '',
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
        uid,
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
