import 'package:equatable/equatable.dart';

class IdeaCategory extends Equatable {
  final String uid;
  final String title;

  const IdeaCategory({
    required this.uid,
    required this.title,
  });

  @override
  String toString() => 'IdeaCategory{ uid: $uid, title: $title,}';

  IdeaCategory copyWith({
    String? uid,
    String? title,
  }) =>
      IdeaCategory(
        uid: uid ?? this.uid,
        title: title ?? this.title,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
      };

  factory IdeaCategory.fromJson(Map<String, dynamic> map) => IdeaCategory(
        uid: map['uid'] as String? ?? '',
        title: map['title'] as String? ?? '',
      );

  @override
  List<Object?> get props => [uid, title];
}
