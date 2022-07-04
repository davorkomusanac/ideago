import 'package:isar/isar.dart';

import '../idea_category.dart';

part 'isar_idea_category.g.dart';

@Collection()
class IsarIdeaCategory {
  int id = Isar.autoIncrement;
  @Index(unique: true)
  late String uid;
  @Index(unique: true, caseSensitive: false)
  late String title;

  IsarIdeaCategory();

  factory IsarIdeaCategory.fromIdeaCategory(IdeaCategory ideaCategory) => IsarIdeaCategory()
    ..uid = ideaCategory.uid
    ..title = ideaCategory.title;

  IdeaCategory toIdeaCategory() => IdeaCategory(
        uid: uid,
        title: title,
      );
}
