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
    _isar = Isar.getInstance()!;
    _isarIdeas = _isar.isarIdeas;
  }

  /// With Isar, you need to create a Query and then watch it to get a Stream
  /// From IsarDB we get back a Stream<List<IsarIdea>> so we need to convert it (map) to Stream<List<Idea>>
  Stream<List<Idea>> getIdeas() {
    Query<IsarIdea> allIdeas = _isarIdeas.where().sortByIndexDesc().limit(15).build();
    return allIdeas.watch(initialReturn: true).map(
          (event) => event
              .map(
                (isarIdea) => isarIdea.toIdea(),
              )
              .toList(),
        );
  }

  Future<void> addIdea(Idea idea) async {
    try {
      await _isar.writeTxn(
        (isar) async {
          await isar.isarIdeas.put(
            IsarIdea.fromIdea(idea),
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteIdea(Idea idea) async {
    try {
      await _isar.writeTxn(
        (isar) async {
          IsarIdea? isarIdea = await _isarIdeas.where().uidEqualTo(idea.uid).findFirst();
          if (isarIdea != null) {
            await isar.isarIdeas.delete(isarIdea.id);
          }
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateIdea(Idea idea) async {
    try {
      await _isar.writeTxn(
        (isar) async {
          await isar.isarIdeas.put(
            IsarIdea.fromIdea(idea),
            replaceOnConflict: true,
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
