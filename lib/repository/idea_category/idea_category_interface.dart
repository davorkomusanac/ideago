import '../../data/models/idea_category/idea_category.dart';

abstract class IdeaCategoryInterface {
  Future<List<IdeaCategory>> getAllIdeaCategories();

  Future<void> addIdeaCategory(IdeaCategory ideaCategory);

  Future<void> deleteIdeaCategory(IdeaCategory ideaCategory);

  Future<void> updateIdeaCategory(IdeaCategory ideaCategory);
}
