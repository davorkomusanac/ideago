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
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> addIdeaCategory(IdeaCategory ideaCategory) async {
    await offlineDb.addIdeaCategory(ideaCategory);
  }

  @override
  Future<void> deleteIdeaCategory(IdeaCategory ideaCategory) async {
    await offlineDb.deleteIdeaCategory(ideaCategory);
  }

  @override
  Future<void> updateIdeaCategory(IdeaCategory ideaCategory) async {
    await offlineDb.updateIdeaCategory(ideaCategory);
  }
}
