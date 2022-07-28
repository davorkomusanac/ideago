import 'package:isar/isar.dart';

import '../../models/idea_category/idea_category.dart';
import '../../models/idea_category/isar_idea_category/isar_idea_category.dart';

class IdeaCategoryOfflineDb {
  late Isar _isar;
  late IsarCollection<IsarIdeaCategory> _isarIdeaCategories;

  IdeaCategoryOfflineDb() {
    initDb();
  }

  void initDb() {
    _isar = Isar.getInstance()!;
    _isarIdeaCategories = _isar.isarIdeaCategorys;
  }

  Future<List<IdeaCategory>> getAllIdeaCategories() async {
    try {
      List<IsarIdeaCategory> allIsarIdeaCategories = await _isarIdeaCategories.where().sortByTitle().findAll();
      List<IdeaCategory> allIdeaCategories = allIsarIdeaCategories
          .map(
            (e) => e.toIdeaCategory(),
          )
          .toList();
      return allIdeaCategories;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addIdeaCategory(IdeaCategory ideaCategory) async {
    try {
      await _isar.writeTxn(
        (isar) async {
          await isar.isarIdeaCategorys.put(
            IsarIdeaCategory.fromIdeaCategory(ideaCategory),
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteIdeaCategory(IdeaCategory ideaCategory) async {
    try {
      await _isar.writeTxn(
        (isar) async {
          IsarIdeaCategory? isarIdeaCategory =
              await _isarIdeaCategories.where().uidEqualTo(ideaCategory.uid).findFirst();
          if (isarIdeaCategory != null) await isar.isarIdeaCategorys.delete(isarIdeaCategory.id);
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateIdeaCategory(IdeaCategory ideaCategory) async {
    try {
      await _isar.writeTxn(
        (isar) async {
          await isar.isarIdeaCategorys.put(
            IsarIdeaCategory.fromIdeaCategory(ideaCategory),
            replaceOnConflict: true,
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
