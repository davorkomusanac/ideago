import 'package:equatable/equatable.dart';

class Idea extends Equatable {
  final String uid;
  final String title;
  final String description;
  final String ideaStatus;
  final double index;
  final int rating;
  final List<String> categories;
  final DateTime dateTimeCreated;

  const Idea({
    required this.uid,
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
      'Idea{ uid: $uid, title: $title, description: $description, ideaStatus: $ideaStatus, index: $index, rating: $rating, categories: $categories, dateTimeCreated: $dateTimeCreated,}';

  Idea copyWith({
    String? uid,
    String? title,
    String? description,
    String? ideaStatus,
    double? index,
    int? rating,
    List<String>? categories,
    DateTime? dateTimeCreated,
  }) =>
      Idea(
        uid: uid ?? this.uid,
        title: title ?? this.title,
        description: description ?? this.description,
        ideaStatus: ideaStatus ?? this.ideaStatus,
        index: index ?? this.index,
        rating: rating ?? this.rating,
        categories: categories ?? this.categories,
        dateTimeCreated: dateTimeCreated ?? this.dateTimeCreated,
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'title': title,
        'description': description,
        'ideaStatus': ideaStatus,
        'index': index,
        'rating': rating,
        'categories': categories,
        'dateTimeCreated': dateTimeCreated,
      };

  factory Idea.fromMap(Map<String, dynamic> map) => Idea(
        uid: map['uid'] as String? ?? '',
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
        uid,
        title,
        description,
        ideaStatus,
        index,
        rating,
        categories,
        dateTimeCreated,
      ];
}
