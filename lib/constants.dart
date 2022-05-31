import 'package:ideago/data/models/idea.dart';
import 'package:uuid/uuid.dart';

List<Idea> tempIdeas = [
  Idea(
    uid: const Uuid().v4(),
    title: 'First Idea',
    description: 'Description of first idea, hmmm really good',
    ideaStatus: 'TODO',
    index: 0,
    rating: 50,
    categories: const <String>['Android', 'iOS'],
    dateTimeCreated: DateTime.now(),
  ),
  Idea(
    uid: const Uuid().v4(),
    title: 'Second Idea',
    description: 'Description of second idea, hmmm really good',
    ideaStatus: 'TRIED',
    index: 1,
    rating: 70,
    categories: const <String>['WEB', 'iOS'],
    dateTimeCreated: DateTime.now(),
  ),
  Idea(
    uid: const Uuid().v4(),
    title: 'Third Idea',
    description: 'Description of third idea, hmmm really good',
    ideaStatus: 'DISCARDED',
    index: 2,
    rating: 80,
    categories: const <String>['Desktop', 'Android', 'iOS'],
    dateTimeCreated: DateTime.now(),
  ),
];
