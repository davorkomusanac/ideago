part of 'rate_idea_cubit.dart';

class RateIdeaState extends Equatable {
  const RateIdeaState({
    this.questionRatings = const <IdeaRatingQuestion>[],
    this.ratingsSum = 50,
  });

  final List<IdeaRatingQuestion> questionRatings;
  final int ratingsSum;

  RateIdeaState copyWith({
    List<IdeaRatingQuestion>? questionRatings,
    int? ratingsSum,
  }) =>
      RateIdeaState(
        questionRatings: questionRatings ?? this.questionRatings,
        ratingsSum: ratingsSum ?? this.ratingsSum,
      );

  @override
  List<Object> get props => [questionRatings, ratingsSum];
}
