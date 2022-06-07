import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'idea.g.dart';

@Collection()
class Idea extends Equatable {
  final int id;
  @Index(caseSensitive: false)
  final String title;
  @Index(caseSensitive: false)
  final String description;
  final String ideaStatus;
  @Index()
  final double index;
  @Index()
  final int rating;
  @Index(caseSensitive: false)
  final List<String> categories;
  @Index()
  final DateTime dateTimeCreated;

  const Idea({
    required this.id,
    required this.title,
    required this.description,
    required this.ideaStatus,
    required this.index,
    required this.rating,
    required this.categories,
    required this.dateTimeCreated,
  });

  @override
  String toString() =>
      'Idea{ id: $id, title: $title, description: $description, ideaStatus: $ideaStatus, index: $index, rating: $rating, categories: $categories, dateTimeCreated: $dateTimeCreated,}';

  Idea copyWith({
    int? id,
    String? title,
    String? description,
    String? ideaStatus,
    double? index,
    int? rating,
    List<String>? categories,
    DateTime? dateTimeCreated,
  }) =>
      Idea(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        ideaStatus: ideaStatus ?? this.ideaStatus,
        index: index ?? this.index,
        rating: rating ?? this.rating,
        categories: categories ?? this.categories,
        dateTimeCreated: dateTimeCreated ?? this.dateTimeCreated,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'ideaStatus': ideaStatus,
        'index': index,
        'rating': rating,
        'categories': categories,
        'dateTimeCreated': dateTimeCreated,
      };

  factory Idea.fromMap(Map<String, dynamic> map) => Idea(
        id: map['id'] as int,
        title: map['title'] as String? ?? '',
        description: map['description'] as String? ?? '',
        ideaStatus: map['ideaStatus'] as String? ?? '',
        index: map['index'] as double? ?? 0,
        rating: map['rating'] as int? ?? 0,
        categories: map['categories'] as List<String>? ?? <String>[],
        dateTimeCreated: map['dateTimeCreated'] as DateTime? ?? DateTime.now(),
      );

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        ideaStatus,
        index,
        rating,
        categories,
        dateTimeCreated,
      ];
}
