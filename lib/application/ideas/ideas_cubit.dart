import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ideago/data/models/idea.dart';

part 'ideas_state.dart';

class IdeasCubit extends Cubit<IdeasState> {
  IdeasCubit() : super(const IdeasState());

  //TODO add .listen to it, and listen as a stream to it
  void allIdeasLoaded() {}

  void ideaAdded() {}

  void ideaDeleted() {}

  void ideaUpdated() {}

  void ideasSorted() {}

  void ideasReordered() {}
}
