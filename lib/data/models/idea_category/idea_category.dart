import 'package:equatable/equatable.dart';

class IdeaCategory extends Equatable {
  final String uid;
  final String title;
  final bool isChecked;

  const IdeaCategory({
    required this.uid,
    required this.title,
    this.isChecked = false,
  });

  @override
  String toString() => 'IdeaCategory{ uid: $uid, title: $title, isChecked: $isChecked,}';

  IdeaCategory copyWith({
    String? uid,
    String? title,
    bool? isChecked,
  }) =>
      IdeaCategory(
        uid: uid ?? this.uid,
        title: title ?? this.title,
        isChecked: isChecked ?? this.isChecked,
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
