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

/// Alert Dialog values
const String kAlertDialogConfirmationTitle = 'Please confirm';
const String kDeleteCategoryDialogContent = 'Are you sure you want to remove this category?';
const String kAlertDialogLeftButtonText = 'Cancel';
const String kAlertDialogRightButtonText = 'Confirm';
const String kDiscardCreateIdeaDialogContent =
    'Are you sure you want to discard this idea? All of your unsaved progress will be lost.';
const String kDiscardUpdateIdeaDialogContent =
    'Are you sure you want to go back? All of your unsaved progress will be lost.';
const String kDeleteIdeaDialogContent = 'Are you sure you want to delete this idea? This action cannot be undone.';
const String kDeleteIdeaDialogRightButtonText = 'Delete';

/// Category bottomsheet
const String kAddCategoryTextFieldHintText = 'Type to find category...';
const String kAddCategoryTextEmptyCategories = 'Start typing to create your first category.';

/// Button Text
const String kCreateIdeaButtonText = 'Create Idea';
const String kUpdateIdeaButtonText = 'Update Idea';

/// Error exception messages
const String kErrorLoadingCategories =
    'There was an error while loading your categories. Please restart your app and try again.';
const String kErrorAddingCategory = 'There was an error while creating your category. Please try again.';
const String kErrorDeletingCategory = 'There was an error while deleting your category. Please try again.';
const String kErrorUpdatingCategory = 'There was an error while updating your category. Please try again.';
