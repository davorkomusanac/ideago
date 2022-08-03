part of 'idea_text_fields_helpers_cubit.dart';

class IdeaTextFieldsHelpersState extends Equatable {
  const IdeaTextFieldsHelpersState({
    this.isDescriptionExpanded = false,
    this.ideaProjectStatus = kIdeaStatusToDo,
  });

  final bool isDescriptionExpanded;
  final String ideaProjectStatus;

  IdeaTextFieldsHelpersState copyWith({
    bool? isDescriptionExpanded,
    String? ideaProjectStatus,
  }) =>
      IdeaTextFieldsHelpersState(
        isDescriptionExpanded: isDescriptionExpanded ?? this.isDescriptionExpanded,
        ideaProjectStatus: ideaProjectStatus ?? this.ideaProjectStatus,
      );

  @override
  List<Object> get props => [
        isDescriptionExpanded,
        ideaProjectStatus,
      ];
}
