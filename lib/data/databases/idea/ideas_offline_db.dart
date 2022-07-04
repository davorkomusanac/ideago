import 'package:isar/isar.dart';

import '../../models/idea/idea.dart';
import '../../models/idea/isar_idea/isar_idea.dart';

class IdeaOfflineDb {
  late Isar _isar;
  late IsarCollection<IsarIdea> _isarIdeas;

  IdeaOfflineDb() {
    initDb();
  }

  void initDb() {
    //TODO Error Handling
    _isar = Isar.getInstance()!;
    _isarIdeas = _isar.isarIdeas;
  }

  //TODO Convert to Stream
  Future<List<Idea>> getAllIdeas() async {
    try {
      List<IsarIdea> allIsarIdeas = await _isarIdeas.where().findAll();
      List<Idea> allIdeas = allIsarIdeas
          .map(
            (e) => e.toIdea(),
          )
          .toList();
      return allIdeas;
    } catch (exception) {
      print('caught first');
      rethrow;
    }
  }

  Future<void> addIdea(Idea idea) async {
    await _isar.writeTxn(
      (isar) async {
        await isar.isarIdeas.put(
          IsarIdea.fromIdea(idea),
        );
      },
    );
  }

  Future<void> deleteIdea(Idea idea) async {
    await _isar.writeTxn(
      (isar) async {
        IsarIdea? isarIdea = await _isarIdeas.where().uidEqualTo(idea.uid).findFirst();
        if (isarIdea != null) {
          await isar.isarIdeas.delete(isarIdea.id);
        }
      },
    );
  }

  Future<void> updateIdea(Idea idea) async {
    await _isar.writeTxn(
      (isar) async {
        await isar.isarIdeas.put(
          IsarIdea.fromIdea(idea),
          replaceOnConflict: true,
        );
      },
    );
  }
}
