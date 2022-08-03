import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

part 'idea_text_fields_helpers_state.dart';

class IdeaTextFieldsHelpersCubit extends Cubit<IdeaTextFieldsHelpersState> {
  IdeaTextFieldsHelpersCubit() : super(const IdeaTextFieldsHelpersState());

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
