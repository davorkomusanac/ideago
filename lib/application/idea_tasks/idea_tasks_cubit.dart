import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../data/models/task/task.dart';

part 'idea_tasks_state.dart';

class IdeaTasksCubit extends Cubit<IdeaTasksState> {
  IdeaTasksCubit() : super(const IdeaTasksState());

  void tasksInitialized(List<Task> tasks) {
    //TODO reorder task reverse index/list index desc
    emit(
      state.copyWith(tasks: tasks),
    );
  }

  void taskCreated(String title) {
    //Currently the app is supporting that a Task can only have a checked and unchecked status
    //In the future it will have 4 different statuses like Ideas, but for right now, To Do will served as unchecked, and Done as checked
    final task = Task(
      uid: const Uuid().v4(),
      title: title,
      status: kIdeaStatusToDo,
      index: state.tasks.isEmpty ? 0 : state.tasks.last.index + 1,
      dateTimeCreated: DateTime.now(),
      dateTimeLastUpdated: DateTime.now(),
    );
    final updatedTasks = [...state.tasks, task];

    emit(
      state.copyWith(tasks: updatedTasks),
    );
  }

  void taskDeleted(Task task) {
    final updatedTasks = [...state.tasks];
    updatedTasks.remove(task);

    emit(
      state.copyWith(tasks: updatedTasks),
    );
  }

  void taskChecked(Task task) {
    final updatedTasks = state.tasks
        .map(
          (e) => e.uid == task.uid
              ? e.copyWith(
                  status: kIdeaStatusDone,
                )
              : e,
        )
        .toList();

    emit(
      state.copyWith(tasks: updatedTasks),
    );
  }

  void taskUnchecked(Task task) {
    final updatedTasks = state.tasks
        .map(
          (e) => e.uid == task.uid
              ? e.copyWith(
                  status: kIdeaStatusToDo,
                )
              : e,
        )
        .toList();

    emit(
      state.copyWith(tasks: updatedTasks),
    );
  }

  void taskReordered({
    required int oldIndex,
    required int newIndex,
  }) {
    //Check if newIndex bigger than old index, if so, reduce it by 1 for correct placing in list.
    final localNewIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final updatedTasks = [...state.tasks];

    if (localNewIndex != oldIndex) {
      late double taskIndexForStorage;
      //This is for moving item index desc, towards the start of the list
      if (oldIndex > localNewIndex) {
        //A succeeding element is needed to calculate the arithmetic average, so that the new order of tasks
        //can be saved to storage without needing to update the rest of untouched items (so there are no repeating indices)
        final succeedingElement = updatedTasks[localNewIndex];
        bool isThereAPrecedingElement = localNewIndex == 0 ? false : true;

        if (isThereAPrecedingElement) {
          final precedingElement = updatedTasks[localNewIndex - 1];
          taskIndexForStorage = (precedingElement.index + succeedingElement.index) / 2;
        } else {
          //Item is placed at the start of the list, there is no preceding element so no need for division,
          //just decrease index by one (index can become negative)
          taskIndexForStorage = succeedingElement.index - 1;
        }
      } else {
        //This is for moving item index asc, towards the end of the list
        final precedingElement = updatedTasks[localNewIndex];
        bool isThereASucceedingElement = updatedTasks.length - 1 > localNewIndex;

        if (isThereASucceedingElement) {
          //A succeeding element is needed to calculate the arithmetic average, so that the new order of tasks
          //can be saved to storage without needing to update the rest of untouched items (so there are no repeating indices)
          final succeedingElement = updatedTasks[localNewIndex + 1];
          taskIndexForStorage = (precedingElement.index + succeedingElement.index) / 2;
        } else {
          //Item is placed at the end of the list, there is no succeeding element so no need for division,
          //just increase index by one
          taskIndexForStorage = precedingElement.index + 1;
        }
      }

      final task = updatedTasks
          .removeAt(
            oldIndex,
          )
          .copyWith(
            index: taskIndexForStorage,
          );
      //Since task are saved in storage when the whole idea gets updated, then it is only necessary
      //to update the task index inside the state itself, no need to interact with the repo inside this cubit.
      updatedTasks.insert(
        localNewIndex,
        task,
      );
      emit(
        state.copyWith(tasks: updatedTasks),
      );
    }
  }
}
