import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

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
  final String ideaStatus;
  @Index()
  final double index;
  @Index()
  final int rating;
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
    required this.ideaStatus,
    required this.index,
    required this.rating,
    required this.categories,
    required this.dateTimeCreated,
    required this.dateTimeLastUpdated,
  });

  @override
  String toString() => 'Idea{ id: $id, title: $title, summary: $summary, '
      'fullDescription: $fullDescription, ideaStatus: $ideaStatus, index: $index, '
      'rating: $rating, categories: $categories, '
      'dateTimeCreated: $dateTimeCreated, dateTimeLastUpdated: $dateTimeLastUpdated,}';

  Idea copyWith({
    int? id,
    String? title,
    String? summary,
    String? fullDescription,
    String? ideaStatus,
    double? index,
    int? rating,
    List<String>? categories,
    DateTime? dateTimeCreated,
    DateTime? dateTimeLastUpdated,
  }) =>
      Idea(
        id: id ?? this.id,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        fullDescription: fullDescription ?? this.fullDescription,
        ideaStatus: ideaStatus ?? this.ideaStatus,
        index: index ?? this.index,
        rating: rating ?? this.rating,
        categories: categories ?? this.categories,
        dateTimeCreated: dateTimeCreated ?? this.dateTimeCreated,
        dateTimeLastUpdated: dateTimeLastUpdated ?? this.dateTimeLastUpdated,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'summary': summary,
        'fullDescription': fullDescription,
        'ideaStatus': ideaStatus,
        'index': index,
        'rating': rating,
        'categories': categories,
        'dateTimeCreated': dateTimeCreated,
        'dateTimeLastUpdated': dateTimeLastUpdated,
      };

  factory Idea.fromMap(Map<String, dynamic> map) => Idea(
        id: map['id'] as int,
        title: map['title'] as String? ?? '',
        summary: map['summary'] as String? ?? '',
        fullDescription: map['fullDescription'] as String? ?? '',
        ideaStatus: map['ideaStatus'] as String? ?? '',
        index: map['index'] as double? ?? 0,
        rating: map['rating'] as int? ?? 0,
        categories: map['categories'] as List<String>? ?? <String>[],
        dateTimeCreated: map['dateTimeCreated'] as DateTime? ?? DateTime.now(),
        dateTimeLastUpdated:
            map['dateTimeLastUpdated'] as DateTime? ?? DateTime.now(),
      );

  @override
  List<Object?> get props => [
        id,
        title,
        summary,
        fullDescription,
        ideaStatus,
        index,
        rating,
        categories,
        dateTimeCreated,
        dateTimeLastUpdated,
      ];
}
