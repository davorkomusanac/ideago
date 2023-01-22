import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../data/models/idea/idea.dart';
import '../../data/models/idea_rating_question/idea_rating_question.dart';
import '../../data/models/task/task.dart';
import '../../repository/idea/idea_repository.dart';

part 'ideas_state.dart';

class ToDoIdeasCubit extends IdeasCubit {
  ToDoIdeasCubit({
    required super.ideasRepository,
    required super.ideaStatus,
  });
}

class InProgressIdeasCubit extends IdeasCubit {
  InProgressIdeasCubit({
    required super.ideasRepository,
    required super.ideaStatus,
  });
}

class DoneIdeasCubit extends IdeasCubit {
  DoneIdeasCubit({
    required super.ideasRepository,
    required super.ideaStatus,
  });
}

class DiscardedIdeasCubit extends IdeasCubit {
  DiscardedIdeasCubit({
    required super.ideasRepository,
    required super.ideaStatus,
  });
}

class IdeasCubit extends Cubit<IdeasState> {
  final IdeaRepository ideasRepository;
  final String ideaStatus;
  StreamSubscription? _stream;

  @override
  Future<void> close() {
    _stream?.cancel();
    return super.close();
  }

  IdeasCubit({
    required this.ideasRepository,
    required this.ideaStatus,
  }) : super(const IdeasState()) {
    ///Start listening to the stream of ideas as soon as the Cubit is constructed and show success and error accordingly
    _stream?.cancel();
    _stream = ideasRepository.watchIdeas(ideaStatus: ideaStatus).listen(
      (ideas) => loadedIdeas(ideas),
      onError: (e) {
        emit(
          state.copyWith(
            status: IdeasStatus.error,
            errorMessageLoadingIdeas: e.toString(),
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
          indexOfNewestIdea: ideas.isNotEmpty ? ideas.first.index : 0,
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
          indexOfNewestIdea: ideas.isNotEmpty ? ideas.first.index : 0,
        ),
      );
    }
  }

  Future<void> ideaSearched([String searchTerm = '']) async {
    try {
      if (searchTerm.isNotEmpty) {
        emit(
          state.copyWith(
            status: IdeasStatus.loading,
          ),
        );

        List<Idea> searchedIdeas = await ideasRepository.searchIdea(
          searchTerm: searchTerm,
          ideaStatus: ideaStatus,
        );

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
  //TODO searchIdeaPagination

  Future<void> fetchedIdeasNextPage(int currentLoadedIdeasLength) async {
    bool isThereMoreIdeasToLoad = false;
    try {
      if (state.isThereMoreIdeasToLoad) {
        List<Idea> ideasNextPage = await ideasRepository.fetchIdeasNextPage(
          currentLoadedIdeasLength: currentLoadedIdeasLength,
          ideaStatus: ideaStatus,
        );
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
    required String revenueExplanation,
    required String differentiationExplanation,
    required String speedExplanation,
    required String capitalExplanation,
    required int rating,
    required List<IdeaRatingQuestion> ratingQuestions,
    required List<String> categories,
    required List<Task> tasks,
  }) async {
    double index = state.ideas.isNotEmpty ? state.indexOfNewestIdea + 1 : 0;
    var idea = Idea(
      uid: const Uuid().v4(),
      title: title,
      summary: summary,
      fullDescription: fullDescription,
      status: status,
      revenueExplanation: revenueExplanation,
      differentiationExplanation: differentiationExplanation,
      speedExplanation: speedExplanation,
      capitalExplanation: capitalExplanation,
      index: index,
      rating: rating,
      ratingQuestions: ratingQuestions,
      categories: categories,
      tasks: tasks,
      dateTimeCreated: DateTime.now(),
      dateTimeLastUpdated: DateTime.now(),
    );
    try {
      await ideasRepository.addIdea(idea);

      if (state.searchTerm.isEmpty) {
        emit(
          state.copyWith(
            status: IdeasStatus.success,
            errorMessage: '',
          ),
        );
      } else {
        ///When search Term is not empty, state.ideas need to be updated manually if there
        ///is a single CRUD operation on a single idea, because state.ideas contains only the filtered ideas
        List<Idea> updatedIdeas = <Idea>[idea, ...state.ideas];
        emit(
          state.copyWith(
            status: IdeasStatus.success,
            ideas: updatedIdeas,
            errorMessage: '',
          ),
        );
      }
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
      await ideasRepository.deleteIdea(idea);

      if (state.searchTerm.isEmpty) {
        emit(
          state.copyWith(
            status: IdeasStatus.success,
            errorMessage: '',
          ),
        );
      } else {
        List<Idea> updatedIdeas = state.ideas.where((e) => e.uid != idea.uid).toList();
        emit(
          state.copyWith(
            status: IdeasStatus.success,
            ideas: updatedIdeas,
            errorMessage: '',
          ),
        );
      }
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
    required String revenueExplanation,
    required String differentiationExplanation,
    required String speedExplanation,
    required String capitalExplanation,
    required double index,
    required int rating,
    required List<IdeaRatingQuestion> ratingQuestions,
    required List<String> categories,
    required List<Task> tasks,
    required DateTime dateTimeCreated,
  }) async {
    var idea = Idea(
      uid: uid,
      title: title,
      summary: summary,
      fullDescription: fullDescription,
      status: status,
      revenueExplanation: revenueExplanation,
      differentiationExplanation: differentiationExplanation,
      speedExplanation: speedExplanation,
      capitalExplanation: capitalExplanation,
      index: index,
      rating: rating,
      ratingQuestions: ratingQuestions,
      categories: categories,
      tasks: tasks,
      dateTimeCreated: dateTimeCreated,
      dateTimeLastUpdated: DateTime.now(),
    );

    try {
      await ideasRepository.updateIdea(idea);

      if (state.searchTerm.isEmpty) {
        emit(
          state.copyWith(
            status: IdeasStatus.success,
            errorMessage: '',
          ),
        );
      } else {
        List<Idea> updatedIdeas = state.ideas
            .map(
              (e) => e.uid != idea.uid ? e : idea,
            )
            .toList();
        emit(
          state.copyWith(
            status: IdeasStatus.success,
            ideas: updatedIdeas,
            errorMessage: '',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: IdeasStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  //TODO Implement custom sort
  void ideasSorted() {}

  //TODO Implement reorder
  void ideasReordered() {}
}
