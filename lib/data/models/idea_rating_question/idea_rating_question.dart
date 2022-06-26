import 'package:equatable/equatable.dart';

class IdeaRatingQuestion extends Equatable {
  final String title;
  final String description;
  final int rating;

  const IdeaRatingQuestion({
    required this.title,
    required this.description,
    required this.rating,
  });

  @override
  String toString() => 'IdeaRatingQuestion{'
      ' title: $title, description: $description, rating: $rating,}';

  IdeaRatingQuestion copyWith({
    String? title,
    String? description,
    int? rating,
  }) =>
      IdeaRatingQuestion(
        title: title ?? this.title,
        description: description ?? this.description,
        rating: rating ?? this.rating,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'rating': rating,
      };

  factory IdeaRatingQuestion.fromJson(Map<String, dynamic> json) => IdeaRatingQuestion(
        title: json['title'] as String? ?? '',
        description: json['description'] as String? ?? '',
        rating: json['rating'] as int? ?? 0,
      );

  @override
  List<Object?> get props => [
        title,
        description,
        rating,
      ];
}
