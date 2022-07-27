import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/idea/idea.dart';
import '../../data/models/idea_rating_question/idea_rating_question.dart';
import '../../repository/idea/idea_repository.dart';

part 'ideas_state.dart';

class IdeasCubit extends Cubit<IdeasState> {
  IdeasCubit(this._ideasRepository) : super(const IdeasState());

  final IdeaRepository _ideasRepository;

  //TODO add .listen to it, and listen as a stream to it
  Future<void> allIdeasLoaded() async {
    try {
      emit(
        state.copyWith(
          status: IdeasStatus.loading,
        ),
      );

      final ideas = await _ideasRepository.getAllIdeas();

      emit(
        state.copyWith(
          ideas: ideas,
          status: IdeasStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: IdeasStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> ideaAdded({
    required String title,
    required String summary,
    required String fullDescription,
    required String status,
    required int rating,
    required List<IdeaRatingQuestion> ratingQuestions,
    required List<String> categories,
  }) async {
    double index = state.ideas.isNotEmpty ? state.ideas.last.index + 1 : 0;
    var idea = Idea(
      uid: const Uuid().v4(),
      title: title,
      summary: summary,
      fullDescription: fullDescription,
      status: status,
      index: index,
      rating: rating,
      ratingQuestions: ratingQuestions,
      categories: categories,
      dateTimeCreated: DateTime.now(),
      dateTimeLastUpdated: DateTime.now(),
    );

    try {
      await _ideasRepository.addIdea(idea);

      var updatedIdeas = [...state.ideas, idea];

      emit(
        state.copyWith(
          status: IdeasStatus.success,
          ideas: updatedIdeas,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: IdeasStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void ideaDeleted() {}

  void ideaUpdated() {}

  void ideasSorted() {}

  void ideasReordered() {}
}
