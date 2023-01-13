import 'dart:developer';

import '../../constants.dart';
import '../../data/databases/idea/idea_offline_db.dart';
import '../../data/models/idea/idea.dart';
import 'idea_interface.dart';

class IdeaRepository implements IdeaInterface {
  final IdeaOfflineDb offlineDb;

  IdeaRepository({required this.offlineDb});

  @override
  Stream<List<Idea>> watchIdeas({required String ideaStatus}) =>
      offlineDb.watchIdeasOfCertainStatus(ideaStatus: ideaStatus).handleError(
        (e) {
          log(e);
          throw kErrorLoadingIdeas;
        },
      );

  @override
  Future<List<Idea>> fetchIdeasNextPage({
    required int currentLoadedIdeasLength,
    required String ideaStatus,
  }) async {
    try {
      List<Idea> ideas = await offlineDb.fetchIdeasOfCertainStatusNextPage(
        currentLoadedIdeasLength: currentLoadedIdeasLength,
        ideaStatus: ideaStatus,
      );
      return ideas;
    } catch (e) {
      log(e.toString());
      throw kErrorLoadingIdeas;
    }
  }

  @override
  Future<List<Idea>> searchIdea({
    required String searchTerm,
    required String ideaStatus,
  }) async {
    try {
      List<Idea> ideas = await offlineDb.searchIdea(
        searchTerm: searchTerm,
        ideaStatus: ideaStatus,
      );
      return ideas;
    } catch (e) {
      log(e.toString());
      throw kErrorLoadingIdeas;
    }
  }

  @override
  Future<void> addIdea(Idea idea) async {
    try {
      await offlineDb.addIdea(idea);
    } catch (e) {
      log(e.toString());
      throw kErrorAddingIdea;
    }
  }

  @override
  Future<void> deleteIdea(Idea idea) async {
    try {
      await offlineDb.deleteIdea(idea);
    } catch (e) {
      log(e.toString());
      throw kErrorDeletingIdea;
    }
  }

  @override
  Future<void> updateIdea(Idea idea) async {
    try {
      await offlineDb.updateIdea(idea);
    } catch (e) {
      log(e.toString());
      throw kErrorUpdatingIdea;
    }
  }
}
