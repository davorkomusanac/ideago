import 'package:uuid/uuid.dart';

import 'data/models/idea/idea.dart';
import 'idea_rating_questions.dart';

List<Idea> tempIdeas = [
  Idea(
    uid: const Uuid().v4(),
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
    uid: const Uuid().v4(),
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
    uid: const Uuid().v4(),
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
const String kIdeaStatusToDo = 'To Do';
const String kIdeaStatusInProgress = 'In Progress';
const String kIdeaStatusDone = 'Done';
const String kIdeaStatusDiscarded = 'Discarded';

/// Add/Update Idea Tab Titles
const String kIdeaTabTitleOne = 'Idea';
const String kIdeaTabTitleTwo = 'Features';

/// IdeaTextFields values
const String kIdeaTextFieldTitleLabel = 'Title';
const String kIdeaTextFieldTitleHint = 'Type the name of your idea..';
const String kIdeaTextFieldSummaryLabel = 'Summary';
const String kIdeaTextFieldSummaryHint = 'Add short summary of your idea..';
const String kIdeaTextFieldFullDescriptionLabel = 'Full description';
const String kIdeaTextFieldFullDescriptionHint = 'Add full description regarding your idea..';
const String kIdeaTextFieldStatus = 'Status';
const String kIdeaTextFieldRatingTitle = 'Rating';
const String kIdeaTextFieldRatingInitialValue = 'Tap to Rate';
const String kIdeaTextFieldCategories = 'Categories';

/// Delete Category Alert Dialog values
const String kDeleteCategoryDialogTitle = 'Please confirm';
const String kDeleteCategoryDialogContent = 'Are you sure you want to remove this category?';
const String kDeleteCategoryDialogLeftButtonText = 'Cancel';
const String kDeleteCategoryDialogRightButtonText = 'Confirm';

const String kAddCategoryTextFieldHintText = 'Type to find category...';
const String kAddCategoryTextEmptyCategories = 'Start typing to create your first category.';
