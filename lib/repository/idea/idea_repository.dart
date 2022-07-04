import '../data/databases/idea/ideas_offline_db.dart';
import '../data/models/idea/idea.dart';
import 'ideas_interface.dart';

class IdeasRepository implements IdeasInterface {
  final IdeaOfflineDB offlineDb;

  IdeasRepository({required this.offlineDb});

  @override
  Future<List<Idea>> getAllIdeas() async {
    try {
      return await offlineDb.getAllIdeas();
    } catch (e) {
      print('second caught');
      rethrow;
    }
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
