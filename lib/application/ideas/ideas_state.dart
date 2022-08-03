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
    this.initialLoadedIdeas = const <Idea>[],
    this.errorMessage = '',
    this.errorMessageLoadingIdeas = '',
    this.isThereMoreIdeasToLoad = true,
    this.searchTerm = '',
  });

  final IdeasStatus status;
  final List<Idea> ideas;
  //An additional List<Idea> needed for real time search, so when search is done, we show back the original ideas
  final List<Idea> initialLoadedIdeas;
  final String errorMessage;
  //An additional String errorMessage to differentiate when showing a SnackBar error for Idea operations and static view for loading ideas
  final String errorMessageLoadingIdeas;
  final bool isThereMoreIdeasToLoad;
  //Search term needed as a property to be able to update real time searched ideas
  final String searchTerm;

  IdeasState copyWith({
    IdeasStatus? status,
    List<Idea>? ideas,
    List<Idea>? initialLoadedIdeas,
    String? errorMessage,
    String? errorMessageLoadingIdeas,
    bool? isThereMoreIdeasToLoad,
    String? searchTerm,
  }) =>
      IdeasState(
        status: status ?? this.status,
        ideas: ideas ?? this.ideas,
        initialLoadedIdeas: initialLoadedIdeas ?? this.initialLoadedIdeas,
        errorMessage: errorMessage ?? this.errorMessage,
        errorMessageLoadingIdeas: errorMessageLoadingIdeas ?? this.errorMessageLoadingIdeas,
        isThereMoreIdeasToLoad: isThereMoreIdeasToLoad ?? this.isThereMoreIdeasToLoad,
        searchTerm: searchTerm ?? this.searchTerm,
      );

  @override
  List<Object> get props => [
        status,
        ideas,
        initialLoadedIdeas,
        errorMessage,
        errorMessageLoadingIdeas,
        isThereMoreIdeasToLoad,
        searchTerm,
      ];
}
