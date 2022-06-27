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
