import '../../data/models/idea/idea.dart';

abstract class IdeaInterface {
  Stream<List<Idea>> getIdeas();

  Future<void> addIdea(Idea idea);

  Future<void> deleteIdea(Idea idea);

  Future<void> updateIdea(Idea idea);
}
