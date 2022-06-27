import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/idea/idea.dart';
import '../../repository/ideas_repository.dart';

part 'ideas_state.dart';

class IdeasCubit extends Cubit<IdeasState> {
  IdeasCubit(this._ideasRepository) : super(const IdeasState());

  final IdeasRepository _ideasRepository;

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

  Future<void> ideaAdded(Idea idea) async {
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
