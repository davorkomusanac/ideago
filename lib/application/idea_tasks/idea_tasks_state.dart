part of 'idea_tasks_cubit.dart';

class IdeaTasksState extends Equatable {
  const IdeaTasksState({
    this.tasks = const <Task>[],
  });

  final List<Task> tasks;

  IdeaTasksState copyWith({
    List<Task>? tasks,
  }) =>
      IdeaTasksState(
        tasks: tasks ?? this.tasks,
      );

  @override
  List<Object> get props => [
        tasks,
      ];
}
