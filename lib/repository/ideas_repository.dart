import 'package:ideago/data/databases/ideas_db.dart';
import 'package:ideago/data/models/idea.dart';
import 'package:ideago/repository/ideas_interface.dart';

class IdeasRepository implements IdeasInterface {
  final IdeasDB db;

  IdeasRepository(this.db);

  @override
  Future<void> addIdea(Idea idea) {
    // TODO: implement addIdea
    throw UnimplementedError();
  }

  @override
  Future<void> deleteIdea(Idea idea) {
    // TODO: implement deleteIdea
    throw UnimplementedError();
  }

  @override
  Future<List<Idea>> getAllIdeas() {
    // TODO: implement getAllIdeas
    throw UnimplementedError();
  }

  @override
  Future<void> updateIdea(Idea idea) {
    // TODO: implement updateIdea
    throw UnimplementedError();
  }
}
