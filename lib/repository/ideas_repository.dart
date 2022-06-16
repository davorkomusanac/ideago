import 'package:ideago/data/databases/ideas_offline_db.dart';
import 'package:ideago/data/models/idea/idea.dart';
import 'package:ideago/repository/ideas_interface.dart';

class IdeasRepository implements IdeasInterface {
  final IdeasOfflineDB offlineDb;

  IdeasRepository({required this.offlineDb});

  @override
  Future<List<Idea>> getAllIdeas() async {
    return await offlineDb.getAllIdeas();
  }

  @override
  Future<void> addIdea(Idea idea) async {
    await offlineDb.addIdea(idea);
  }

  @override
  Future<void> deleteIdea(Idea idea) async {
    await offlineDb.deleteIdea(idea);
  }

  @override
  Future<void> updateIdea(Idea idea) async {
    await offlineDb.updateIdea(idea);
  }
}
