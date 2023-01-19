import 'package:equatable/equatable.dart';

import '../idea_rating_question/idea_rating_question.dart';
import '../task/task.dart';

class Idea extends Equatable {
  final String uid;
  final String title;
  final String summary;
  final String fullDescription;
  final String status;
  final String revenueExplanation;
  final String differentiationExplanation;
  final String speedExplanation;
  final String capitalExplanation;
  final double index;
  final int rating;
  final List<IdeaRatingQuestion> ratingQuestions;
  final List<String> categories;
  final List<Task> tasks;
  final DateTime dateTimeCreated;
  final DateTime dateTimeLastUpdated;

  const Idea({
    required this.uid,
    required this.title,
    required this.summary,
    required this.fullDescription,
    required this.status,
    required this.revenueExplanation,
    required this.differentiationExplanation,
    required this.speedExplanation,
    required this.capitalExplanation,
    required this.index,
    required this.rating,
    required this.ratingQuestions,
    required this.categories,
    required this.tasks,
    required this.dateTimeCreated,
    required this.dateTimeLastUpdated,
  });

  @override
  String toString() =>
      'Idea{uid: $uid, title: $title, summary: $summary, fullDescription: $fullDescription, status: $status, '
      'revenueExplanation: $revenueExplanation, differentiationExplanation: $differentiationExplanation, '
      'speedExplanation: $speedExplanation, capitalExplanation: $capitalExplanation, index: $index, '
      'rating: $rating, ratingQuestions: $ratingQuestions, categories: $categories, tasks: $tasks, '
      'dateTimeCreated: $dateTimeCreated, dateTimeLastUpdated: $dateTimeLastUpdated}';

  Idea copyWith({
    String? uid,
    String? title,
    String? summary,
    String? fullDescription,
    String? status,
    String? revenueExplanation,
    String? differentiationExplanation,
    String? speedExplanation,
    String? capitalExplanation,
    double? index,
    int? rating,
    List<IdeaRatingQuestion>? ratingQuestions,
    List<String>? categories,
    List<Task>? tasks,
    DateTime? dateTimeCreated,
    DateTime? dateTimeLastUpdated,
  }) =>
      Idea(
        uid: uid ?? this.uid,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        fullDescription: fullDescription ?? this.fullDescription,
        status: status ?? this.status,
        revenueExplanation: revenueExplanation ?? this.revenueExplanation,
        differentiationExplanation: differentiationExplanation ?? this.differentiationExplanation,
        speedExplanation: speedExplanation ?? this.speedExplanation,
        capitalExplanation: capitalExplanation ?? this.capitalExplanation,
        index: index ?? this.index,
        rating: rating ?? this.rating,
        ratingQuestions: ratingQuestions ?? this.ratingQuestions,
        categories: categories ?? this.categories,
        tasks: tasks ?? this.tasks,
        dateTimeCreated: dateTimeCreated ?? this.dateTimeCreated,
        dateTimeLastUpdated: dateTimeLastUpdated ?? this.dateTimeLastUpdated,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
        'summary': summary,
        'fullDescription': fullDescription,
        'revenueExplanation': revenueExplanation,
        'differentiationExplanation': differentiationExplanation,
        'speedExplanation': speedExplanation,
        'capitalExplanation': capitalExplanation,
        'status': status,
        'index': index,
        'rating': rating,
        'ratingQuestions': ratingQuestions.map((question) => question.toJson()).toList(),
        'categories': categories,
        'tasks': tasks.map((task) => task.toJson()).toList(),
        'dateTimeCreated': dateTimeCreated,
        'dateTimeLastUpdated': dateTimeLastUpdated,
      };

  factory Idea.fromJson(Map<String, dynamic> json) => Idea(
        uid: json['uid'] as String? ?? '',
        title: json['title'] as String? ?? '',
        summary: json['summary'] as String? ?? '',
        fullDescription: json['fullDescription'] as String? ?? '',
        status: json['status'] as String? ?? '',
        revenueExplanation: json['revenueExplanation'] as String? ?? '',
        differentiationExplanation: json['differentiationExplanation'] as String? ?? '',
        speedExplanation: json['speedExplanation'] as String? ?? '',
        capitalExplanation: json['capitalExplanation'] as String? ?? '',
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
        tasks: (json['tasks'] is List)
            ? (json['tasks'] as List)
                .map(
                  (q) => Task.fromJson(q),
                )
                .toList()
            : <Task>[],
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
        revenueExplanation,
        differentiationExplanation,
        speedExplanation,
        capitalExplanation,
        index,
        rating,
        ratingQuestions,
        categories,
        tasks,
        dateTimeCreated,
        dateTimeLastUpdated,
      ];
}
