import 'dart:developer';

import '../../constants.dart';
import '../../data/databases/idea_category/idea_category_offline_db.dart';
import '../../data/models/idea_category/idea_category.dart';
import 'idea_category_interface.dart';

class IdeaCategoryRepository implements IdeaCategoryInterface {
  final IdeaCategoryOfflineDb offlineDb;

  IdeaCategoryRepository({required this.offlineDb});

  @override
  Future<List<IdeaCategory>> getAllIdeaCategories() async {
    try {
      return await offlineDb.getAllIdeaCategories();
    } catch (e) {
      log(e.toString());
      throw kErrorLoadingCategories;
    }
  }

  @override
  Future<void> addIdeaCategory(IdeaCategory ideaCategory) async {
    try {
      await offlineDb.addIdeaCategory(ideaCategory);
    } catch (e) {
      log(e.toString());
      throw kErrorAddingCategory;
    }
  }

  @override
  Future<void> deleteIdeaCategory(IdeaCategory ideaCategory) async {
    try {
      await offlineDb.deleteIdeaCategory(ideaCategory);
    } catch (e) {
      log(e.toString());
      throw kErrorDeletingCategory;
    }
  }

  @override
  Future<void> updateIdeaCategory(IdeaCategory ideaCategory) async {
    try {
      await offlineDb.updateIdeaCategory(ideaCategory);
    } catch (e) {
      log(e.toString());
      throw kErrorUpdatingCategory;
    }
  }
}
