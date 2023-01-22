const String kAppName = 'IdeaGo';

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
const String kIdeaTextFieldTasks = 'Tasks';
const String kIdeaTextFieldTasksHint = 'Press the button to create tasks..';
const String kIdeaTextFieldStatus = 'Status';
const String kIdeaTextFieldRatingTitle = 'Rating';
const String kIdeaTextFieldRatingInitialValue = 'Tap to Rate';
const String kIdeaTextFieldCategories = 'Categories';
const String kIdeaTextFieldSearchHint = 'Type to search a specific idea.';

const String kIdeaTextFieldHowAreYouGoingToEarnMoneyLabel = 'Revenue';
const String kIdeaTextFieldHowAreYouGoingToEarnMoneyHint = 'How are you going to earn money?';
const String kIdeaTextFieldHowAreYouDifferentLabel = 'Differentiation';
const String kIdeaTextFieldHowAreYouDifferentHint = 'How are you different from the rest?';
const String kIdeaTextFieldHowFastToLaunchLabel = 'Speed';
const String kIdeaTextFieldHowFastToLaunchHint = 'How fast can you launch?';
const String kIdeaTextFieldHowMuchTimeAndMoneyNeededLabel = 'Capital';
const String kIdeaTextFieldHowMuchTimeAndMoneyNeededHint = 'How much time and money is needed?';

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

const String kErrorLoadingIdeas = 'There was an error while loading your ideas. Please restart your app and try again.';
const String kErrorAddingIdea = 'There was an error while creating your idea. Please try again.';
const String kErrorDeletingIdea = 'There was an error while deleting your idea. Please try again.';
const String kErrorUpdatingIdea = 'There was an error while updating your idea. Please try again.';

/// Int value for limiting the number of elements read from storage in a single operation
const int kNumberOfIdeasReadLimit = 12;

/// Empty ideas list text placeholder
const String kNoIdeasCreatedYet = 'Start adding your first ideas.';
const String kNoIdeasFound = 'No idea found. Try changing your search term or create a new idea.';

/// App bar title values
const String kAppBarRateIdeaTitle = 'Rate idea';

/// Values for SharedPrefs storage
const String kSharedPrefsIdeaTabViewKey = 'listViewIsIdeaTabViewPref';

/// Add Idea Tasks
const String kAddIdeaTasksEmptyTasks = 'You have no tasks. Create your first task.';
const String kAddIdeaTaskTextFieldHintText = 'Type to create task';
