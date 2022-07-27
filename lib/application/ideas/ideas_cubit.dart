import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/idea/idea.dart';
import '../../data/models/idea_rating_question/idea_rating_question.dart';
import '../../repository/idea/idea_repository.dart';

part 'ideas_state.dart';

class IdeasCubit extends Cubit<IdeasState> {
  IdeasCubit(this._ideasRepository) : super(const IdeasState()) {
    _stream?.cancel();
    _stream = _ideasRepository.getIdeas().listen(
      (ideas) {
        _initialLoaded(ideas);
      },
    );
  }

  @override
  Future<void> close() {
    _stream?.cancel();
    return super.close();
  }

  final IdeaRepository _ideasRepository;
  StreamSubscription? _stream;

  Future<void> _initialLoaded(List<Idea> ideas) async {
    emit(
      state.copyWith(
        ideas: ideas,
        status: IdeasStatus.success,
      ),
    );
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

      emit(
        state.copyWith(
          status: IdeasStatus.success,
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

  Future<void> ideaDeleted({required Idea idea}) async {
    try {
      await _ideasRepository.deleteIdea(idea);

      emit(
        state.copyWith(
          status: IdeasStatus.success,
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

  Future<void> ideaUpdated({
    required String uid,
    required String title,
    required String summary,
    required String fullDescription,
    required String status,
    required double index,
    required int rating,
    required List<IdeaRatingQuestion> ratingQuestions,
    required List<String> categories,
    required DateTime dateTimeCreated,
  }) async {
    var idea = Idea(
      uid: uid,
      title: title,
      summary: summary,
      fullDescription: fullDescription,
      status: status,
      index: index,
      rating: rating,
      ratingQuestions: ratingQuestions,
      categories: categories,
      dateTimeCreated: dateTimeCreated,
      dateTimeLastUpdated: DateTime.now(),
    );

    try {
      await _ideasRepository.updateIdea(idea);

      emit(
        state.copyWith(
          status: IdeasStatus.success,
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

  void ideasSorted() {}

  void ideasReordered() {}
}
