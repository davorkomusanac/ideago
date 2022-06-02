part of 'ideas_cubit.dart';

enum IdeasStatus {
  initial,
  loading,
  success,
  error,
}

class IdeasState extends Equatable {
  const IdeasState({
    this.status = IdeasStatus.initial,
    this.ideas = const <Idea>[],
    this.errorMessage = '',
  });

  final IdeasStatus status;
  final List<Idea> ideas;
  final String errorMessage;

  IdeasState copyWith({
    IdeasStatus? status,
    List<Idea>? ideas,
    String? errorMessage,
  }) =>
      IdeasState(
        status: status ?? this.status,
        ideas: ideas ?? this.ideas,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [status, ideas, errorMessage];
}
