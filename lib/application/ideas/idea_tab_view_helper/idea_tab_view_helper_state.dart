part of 'idea_tab_view_helper_cubit.dart';

class IdeaTabViewHelperState extends Equatable {
  const IdeaTabViewHelperState({
    this.isListViewSelected = true,
  });

  final bool isListViewSelected;

  IdeaTabViewHelperState copyWith({
    bool? isListViewSelected,
  }) =>
      IdeaTabViewHelperState(
        isListViewSelected: isListViewSelected ?? this.isListViewSelected,
      );

  @override
  List<Object> get props => [
        isListViewSelected,
      ];
}
