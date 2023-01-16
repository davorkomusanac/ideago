import 'dart:async';

import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';
import 'data/models/idea_category/idea_category.dart';

String formatIdeaRatingResult(int ratingsSum) {
  String result;
  if (ratingsSum < 25) {
    result = '$ratingsSum - Forget it';
  } else if (ratingsSum < 50) {
    result = '$ratingsSum - Not worth';
  } else if (ratingsSum < 65) {
    result = '$ratingsSum - Mediocre';
  } else if (ratingsSum < 75) {
    result = '$ratingsSum - Interesting';
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

Color showIdeaRatingColor(int rating) {
  if (rating < 25) {
    return AppColors.darkRed;
  } else if (rating < 50) {
    return AppColors.red;
  } else if (rating < 65) {
    return AppColors.orange;
  } else if (rating < 75) {
    return AppColors.darkYellow;
  } else if (rating < 90) {
    return AppColors.green;
  } else {
    return AppColors.lightGreen;
  }
}

Color showStatusColor(String status) {
  if (status == kIdeaStatusToDo) {
    return AppColors.grey;
  } else if (status == kIdeaStatusInProgress) {
    return AppColors.yellow;
  } else if (status == kIdeaStatusDone) {
    return AppColors.green;
  } else {
    return AppColors.red;
  }
}

TextDecoration showStatusTextDecoration(String status) {
  if (status == kIdeaStatusToDo) {
    return TextDecoration.underline;
  } else if (status == kIdeaStatusInProgress) {
    return TextDecoration.none;
  } else {
    return TextDecoration.lineThrough;
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

///Take in a list of categories for an idea and return the number of categories to actually render on screen.
///
///Categories are of dynamic length and it is hard to check by itself how much exact screen space they will take up.
///This method is then needed for a "hacky" solution, where a TextPainter is used to check how much space a TextSpan containing all
///of the categories would take up on a screen. It is called iteratively for each element so that when there are too many
///categories to render on screen, it will cut it off and show how many remaining categories there are.
List<String> formatCategoriesToRenderForIdeaCard({
  required List<String> categories,
  required double maxWidth,
}) {
  String text = '';
  bool didExceedRender = false;
  int numberOfCategoriesLeftToShow = 0;

  for (int i = 0; i < categories.length; i++) {
    text += ' ${categories[i]}';

    var span = TextSpan(
      text: text,
      style: const TextStyle(fontSize: 34),
    );

    var tp = TextPainter(
      maxLines: 1,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      text: span,
    );

    tp.layout(maxWidth: maxWidth);

    didExceedRender = tp.didExceedMaxLines;

    if (didExceedRender) {
      numberOfCategoriesLeftToShow = categories.length - i;
      break;
    }
  }

  int indexOfLastCategoryToShow = categories.length - numberOfCategoriesLeftToShow;

  return didExceedRender
      ? [...categories.sublist(0, indexOfLastCategoryToShow), '+$numberOfCategoriesLeftToShow']
      : [...categories];
}
