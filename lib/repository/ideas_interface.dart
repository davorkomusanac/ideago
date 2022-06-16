import 'package:ideago/data/models/idea/idea.dart';

abstract class IdeasInterface {
  Future<List<Idea>> getAllIdeas();

  Future<void> addIdea(Idea idea);

  Future<void> deleteIdea(Idea idea);

  Future<void> updateIdea(Idea idea);
}
