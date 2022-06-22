part of 'add_or_update_idea_cubit.dart';

class AddOrUpdateIdeaState extends Equatable {
  const AddOrUpdateIdeaState({
    this.isDescriptionExpanded = false,
    this.ideaProjectStatus = ideaStatusToDo,
  });

  final bool isDescriptionExpanded;
  final String ideaProjectStatus;

  AddOrUpdateIdeaState copyWith({
    bool? isDescriptionExpanded,
    String? ideaProjectStatus,
  }) =>
      AddOrUpdateIdeaState(
        isDescriptionExpanded: isDescriptionExpanded ?? this.isDescriptionExpanded,
        ideaProjectStatus: ideaProjectStatus ?? this.ideaProjectStatus,
      );

  @override
  List<Object> get props => [
        isDescriptionExpanded,
        ideaProjectStatus,
      ];
}
