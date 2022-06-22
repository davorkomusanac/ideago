import 'package:ideago/data/models/idea/idea.dart';

List<Idea> tempIdeas = [
  Idea(
    id: 1,
    title: 'First Idea',
    summary: 'Short description',
    fullDescription: 'Description of first idea, hmmm really good',
    ideaStatus: 'TODO',
    index: 0,
    rating: 50,
    categories: const <String>['Android', 'iOS'],
    dateTimeCreated: DateTime.now(),
    dateTimeLastUpdated: DateTime.now(),
  ),
  Idea(
    id: 2,
    title: 'Second Idea',
    summary: 'Short description',
    fullDescription: 'Description of first idea, hmmm really good',
    ideaStatus: 'TRIED',
    index: 1,
    rating: 70,
    categories: const <String>['WEB', 'iOS'],
    dateTimeCreated: DateTime.now(),
    dateTimeLastUpdated: DateTime.now(),
  ),
  Idea(
    id: 3,
    title: 'Third Idea',
    summary: 'Short description',
    fullDescription: 'Description of first idea, hmmm really good',
    ideaStatus: 'DISCARDED',
    index: 2,
    rating: 80,
    categories: const <String>['Desktop', 'Android', 'iOS'],
    dateTimeCreated: DateTime.now(),
    dateTimeLastUpdated: DateTime.now(),
  ),
];

/// Add/Update Idea possible statuses
const String ideaStatusToDo = 'To Do';
const String ideaStatusInProgress = 'In Progress';
const String ideaStatusDone = 'Done';
const String ideaStatusDiscarded = 'Discarded';

/// Add/Update Idea Tab Titles
const String ideaTabTitleOne = 'Idea';
const String ideaTabTitleTwo = 'Features';

/// IdeaTextFields values
const String ideaTextFieldTitleLabel = 'Title';
const String ideaTextFieldTitleHint = 'Type the name of your idea..';
const String ideaTextFieldSummaryLabel = 'Summary';
const String ideaTextFieldSummaryHint = 'Add short summary of your idea..';
const String ideaTextFieldFullDescriptionLabel = 'Full description';
const String ideaTextFieldFullDescriptionHint = 'Add full description regarding your idea..';
