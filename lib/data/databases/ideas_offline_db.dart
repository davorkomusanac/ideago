import 'package:isar/isar.dart';

import '../models/idea.dart';

class IdeasOfflineDB {
  late Isar _isar;
  late IsarCollection<Idea> _ideas;

  IdeasOfflineDB() {
    initDb();
  }

  Future<void> initDb() async {
    _isar = await Isar.open(
      schemas: [IdeaSchema],
    );
    _ideas = _isar.ideas;
  }

  Future<List<Idea>> getAllIdeas() async {
    List<Idea> allIdeas = await _ideas.where().findAll();
    return allIdeas;
  }

  Future<void> addIdea(Idea idea) async {
    await _isar.writeTxn(
      (isar) async {
        await isar.ideas.put(idea);
      },
    );
  }

  Future<void> deleteIdea(Idea idea) async {
    await _isar.writeTxn(
      (isar) async {
        await isar.ideas.delete(idea.id);
      },
    );
  }

  Future<void> updateIdea(Idea idea) async {
    await _isar.writeTxn(
      (isar) async {
        await isar.ideas.put(idea);
      },
    );
  }
}
