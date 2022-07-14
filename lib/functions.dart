import 'data/models/idea_category/idea_category.dart';

String formatIdeaRatingResult(int ratingsSum) {
  String result;
  if (ratingsSum < 25) {
    result = '$ratingsSum - Abandon it';
  } else if (ratingsSum < 50) {
    result = '$ratingsSum - Not worth';
  } else if (ratingsSum < 75) {
    result = '$ratingsSum - Mediocre';
  } else if (ratingsSum < 90) {
    result = '$ratingsSum - Promising';
  } else {
    result = '$ratingsSum - Amazing';
  }
  return result;
}

///Sort categories first by checkedStatus and then alphabetically
void sortCategories(List<IdeaCategory> categories) {
  categories.sort((prev, next) {
    if (prev.isChecked && !next.isChecked) {
      return -1;
    } else if (!prev.isChecked && next.isChecked) {
      return 1;
    } else {
      return prev.title.compareTo(next.title);
    }
  });
}
