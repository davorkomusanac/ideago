import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

part 'add_or_update_idea_state.dart';

class AddOrUpdateIdeaCubit extends Cubit<AddOrUpdateIdeaState> {
  AddOrUpdateIdeaCubit() : super(const AddOrUpdateIdeaState());

  void descriptionButtonPressed() {
    emit(
      state.copyWith(
        isDescriptionExpanded: !state.isDescriptionExpanded,
      ),
    );
  }

  void ideaStatusChanged(String newStatus) {
    emit(
      state.copyWith(
        ideaProjectStatus: newStatus,
      ),
    );
  }
}
