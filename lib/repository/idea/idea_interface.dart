import '../../data/models/idea/idea.dart';

abstract class IdeaInterface {
  Stream<List<Idea>> watchIdeas({required String ideaStatus});

  Future<List<Idea>> fetchIdeasNextPage({
    required int currentLoadedIdeasLength,
    required String ideaStatus,
  });

  Future<void> addIdea(Idea idea);

  Future<void> deleteIdea(Idea idea);

  Future<void> updateIdea(Idea idea);

  Future<List<Idea>> searchIdea({
    required String searchTerm,
    required String ideaStatus,
  });
}
