part of 'ideas_cubit.dart';

enum IdeasStatus {
  loading,
  success,
  error,
}

class IdeasState extends Equatable {
  const IdeasState({
    this.status = IdeasStatus.loading,
    this.ideas = const <Idea>[],
    this.errorMessage = '',
    this.errorMessageLoadingIdeas = '',
    this.isThereMoreIdeasToLoad = true,
  });

  final IdeasStatus status;
  final List<Idea> ideas;
  final String errorMessage;
  //An additional String errorMessage to differentiate when showing a SnackBar error for Idea operations and static view for loading ideas
  final String errorMessageLoadingIdeas;
  final bool isThereMoreIdeasToLoad;

  IdeasState copyWith({
    IdeasStatus? status,
    List<Idea>? ideas,
    String? errorMessage,
    String? errorMessageLoadingIdeas,
    bool? isThereMoreIdeasToLoad,
  }) =>
      IdeasState(
        status: status ?? this.status,
        ideas: ideas ?? this.ideas,
        errorMessage: errorMessage ?? this.errorMessage,
        errorMessageLoadingIdeas: errorMessageLoadingIdeas ?? this.errorMessageLoadingIdeas,
        isThereMoreIdeasToLoad: isThereMoreIdeasToLoad ?? this.isThereMoreIdeasToLoad,
      );

  @override
  List<Object> get props => [
        status,
        ideas,
        errorMessage,
        errorMessageLoadingIdeas,
        isThereMoreIdeasToLoad,
      ];
}
