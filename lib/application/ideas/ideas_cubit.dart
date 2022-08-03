import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../data/models/idea/idea.dart';
import '../../data/models/idea_rating_question/idea_rating_question.dart';
import '../../repository/idea/idea_repository.dart';

part 'ideas_state.dart';

class IdeasCubit extends Cubit<IdeasState> {
  final IdeaRepository _ideasRepository;
  StreamSubscription? _stream;

  @override
  Future<void> close() {
    _stream?.cancel();
    return super.close();
  }

  IdeasCubit(this._ideasRepository) : super(const IdeasState()) {
    ///Start listening to the stream of ideas as soon as the Cubit is constructed and show success and error accordingly
    _stream?.cancel();
    _stream = _ideasRepository.watchIdeas().listen(
      (ideas) => loadedIdeas(ideas),
      onError: (e) {
        emit(
          state.copyWith(
            status: IdeasStatus.error,
            errorMessageLoadingIdeas: e,
          ),
        );
      },
    );
  }

  void loadedIdeas(List<Idea> ideas) {
    //If there is nothing searched, then show all loaded ideas
    if (state.searchTerm.isEmpty) {
      emit(
        state.copyWith(
          ideas: ideas,
          initialLoadedIdeas: ideas,
          status: IdeasStatus.success,
          errorMessageLoadingIdeas: '',
          isThereMoreIdeasToLoad: ideas.length < kNumberOfIdeasReadLimit ? false : true,
        ),
      );
    } else {
      //If something is currently searched, then only update the initialLoadedIdeas
      //so that it is updated when user finishes his search
      emit(
        state.copyWith(
          initialLoadedIdeas: ideas,
          status: IdeasStatus.success,
          errorMessageLoadingIdeas: '',
        ),
      );
    }
  }

  Future<void> ideaSearched(String searchTerm) async {
    try {
      if (searchTerm.isNotEmpty) {
        emit(
          state.copyWith(
            status: IdeasStatus.loading,
          ),
        );

        List<Idea> searchedIdeas = await _ideasRepository.searchIdea(searchTerm);

        emit(
          state.copyWith(
            status: IdeasStatus.success,
            ideas: searchedIdeas,
            errorMessageLoadingIdeas: '',
            isThereMoreIdeasToLoad: false,
            searchTerm: searchTerm,
          ),
        );
      } else {
        //If searchTerm is empty, user cleared his search, and show back the original unfiltered list of ideas
        emit(
          state.copyWith(
            status: IdeasStatus.success,
            ideas: state.initialLoadedIdeas,
            errorMessageLoadingIdeas: '',
            searchTerm: '',
            isThereMoreIdeasToLoad: state.initialLoadedIdeas.length < kNumberOfIdeasReadLimit ? false : true,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: IdeasStatus.error,
          errorMessageLoadingIdeas: e.toString(),
        ),
      );
    }
  }

  Future<void> fetchedIdeasNextPage(int currentLoadedIdeasLength) async {
    bool isThereMoreIdeasToLoad = false;
    try {
      if (state.isThereMoreIdeasToLoad) {
        List<Idea> ideasNextPage = await _ideasRepository.fetchIdeasNextPage(currentLoadedIdeasLength);
        isThereMoreIdeasToLoad = ideasNextPage.length < kNumberOfIdeasReadLimit ? false : true;
        List<Idea> updatedIdeas = <Idea>[...state.ideas, ...ideasNextPage];

        emit(
          state.copyWith(
            status: IdeasStatus.success,
            ideas: updatedIdeas,
            errorMessageLoadingIdeas: '',
            isThereMoreIdeasToLoad: isThereMoreIdeasToLoad,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: IdeasStatus.error,
          errorMessageLoadingIdeas: e.toString(),
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
    double index = state.ideas.isNotEmpty ? state.ideas.first.index + 1 : 0;
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
