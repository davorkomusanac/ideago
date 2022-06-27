import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/idea_rating_question/idea_rating_question.dart';

part 'rate_idea_state.dart';

class RateIdeaCubit extends Cubit<RateIdeaState> {
  RateIdeaCubit() : super(const RateIdeaState());

  void ratingsLoaded({
    required List<IdeaRatingQuestion> questionRatings,
    required int ratingsSum,
  }) {
    emit(
      state.copyWith(
        questionRatings: questionRatings,
        ratingsSum: ratingsSum,
      ),
    );
  }

  void rateQuestion({
    required int questionIndex,
    required int questionRating,
  }) {
    //deep copy the question ratings list and then update the specific rating
    var updatedRatings = state.questionRatings.map((e) => e).toList();
    updatedRatings[questionIndex] = updatedRatings[questionIndex].copyWith(
      rating: questionRating,
    );

    var updatedRatingsSum = updatedRatings.fold<int>(
      0,
      (prev, next) => prev + next.rating,
    );

    emit(
      state.copyWith(
        questionRatings: updatedRatings,
        ratingsSum: updatedRatingsSum,
      ),
    );
  }
}
