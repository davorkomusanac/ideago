import 'data/models/idea/idea.dart';
import 'idea_rating_questions.dart';

List<Idea> tempIdeas = [
  Idea(
    id: 1,
    title: 'First Idea',
    summary: 'Short description',
    fullDescription: 'Description of first idea, hmmm really good',
    status: 'TODO',
    index: 0,
    rating: 50,
    ratingQuestions: initialIdeaRatingQuestions,
    categories: const <String>['Android', 'iOS'],
    dateTimeCreated: DateTime.now(),
    dateTimeLastUpdated: DateTime.now(),
  ),
  Idea(
    id: 2,
    title: 'Second Idea',
    summary: 'Short description',
    fullDescription: 'Description of first idea, hmmm really good',
    status: 'TRIED',
    index: 1,
    rating: 70,
    ratingQuestions: initialIdeaRatingQuestions,
    categories: const <String>['WEB', 'iOS'],
    dateTimeCreated: DateTime.now(),
    dateTimeLastUpdated: DateTime.now(),
  ),
  Idea(
    id: 3,
    title: 'Third Idea',
    summary: 'Short description',
    fullDescription: 'Description of first idea, hmmm really good',
    status: 'DISCARDED',
    index: 2,
    rating: 80,
    ratingQuestions: initialIdeaRatingQuestions,
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
const String ideaTextFieldStatus = 'Status';
const String ideaTextFieldRatingTitle = 'Rating';
const String ideaTextFieldRatingInitialValue = 'N/A';
const String ideaTextFieldCategories = 'Categories';
