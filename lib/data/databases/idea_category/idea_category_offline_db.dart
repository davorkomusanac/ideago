import 'package:isar/isar.dart';

import '../../models/idea_category/idea_category.dart';
import '../../models/idea_category/isar_idea_category/isar_idea_category.dart';

class IdeaCategoryOfflineDb {
  late Isar _isar;
  late IsarCollection<IsarIdeaCategory> _isarIdeaCategories;

  IdeaCategoryOfflineDb() {
    initDb();
  }

  //TODO error handling
  void initDb() {
    _isar = Isar.getInstance()!;
    _isarIdeaCategories = _isar.isarIdeaCategorys;
  }

  Future<List<IdeaCategory>> getAllIdeaCategories() async {
    List<IsarIdeaCategory> allIsarIdeaCategories = await _isarIdeaCategories.where().sortByTitle().findAll();
    List<IdeaCategory> allIdeaCategories = allIsarIdeaCategories
        .map(
          (e) => e.toIdeaCategory(),
        )
        .toList();
    return allIdeaCategories;
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
      print(e.toString());
    }
  }

  Future<void> deleteIdeaCategory(IdeaCategory ideaCategory) async {
    await _isar.writeTxn(
      (isar) async {
        IsarIdeaCategory? isarIdeaCategory = await _isarIdeaCategories.where().uidEqualTo(ideaCategory.uid).findFirst();
        if (isarIdeaCategory != null) await isar.isarIdeaCategorys.delete(isarIdeaCategory.id);
      },
    );
  }

  Future<void> updateIdeaCategory(IdeaCategory ideaCategory) async {
    await _isar.writeTxn(
      (isar) async {
        await isar.isarIdeaCategorys.put(
          IsarIdeaCategory.fromIdeaCategory(ideaCategory),
          replaceOnConflict: true,
        );
      },
    );
  }
}
