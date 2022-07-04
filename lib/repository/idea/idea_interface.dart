import '../../data/models/idea/idea.dart';

abstract class IdeaInterface {
  Future<List<Idea>> getAllIdeas();

  Future<void> addIdea(Idea idea);

  Future<void> deleteIdea(Idea idea);

  Future<void> updateIdea(Idea idea);
}
