import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/idea_tasks/idea_tasks_cubit.dart';
import '../../../../colors.dart';
import '../../../../constants.dart';
import '../../../../data/models/task/task.dart';
import '../../../widgets/adaptive_alert_dialog.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    required this.task,
    required this.index,
    Key? key,
  }) : super(key: key);

  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: AppColors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                style: BorderStyle.solid,
                width: 1.0,
                color: AppColors.black.withOpacity(0.2),
              ),
            ),
          ),
          child: CheckboxListTile(
            //Currently the app is supporting that a Task can only have a checked and unchecked status
            //In the future it will have 4 different statuses like Ideas, but for right now, To Do will served as unchecked, and Done as checked
            value: task.status == kIdeaStatusDone,
            activeColor: AppColors.grey,
            contentPadding: const EdgeInsets.symmetric(horizontal: 6.0),
            onChanged: (val) {
              if (val != null) {
                val
                    ? context.read<IdeaTasksCubit>().taskChecked(task)
                    : context.read<IdeaTasksCubit>().taskUnchecked(task);
              }
            },
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.status == kIdeaStatusDone ? TextDecoration.lineThrough : null,
                color: task.status == kIdeaStatusDone ? AppColors.grey : AppColors.white,
              ),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            secondary: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: AppColors.transparentColor,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: IconButton(
                    onPressed: () {
                      //Dismiss keyboard
                      FocusManager.instance.primaryFocus?.unfocus();

                      showOkCancelAlertDialog(
                        context: context,
                        builder: (_, __) => AdaptiveAlertDialog(
                          title: kAlertDialogConfirmationTitle,
                          content: kDeleteCategoryDialogContent,
                          leftButtonText: kAlertDialogLeftButtonText,
                          rightButtonText: kAlertDialogRightButtonText,
                          onLeftButtonPressed: () => Navigator.of(context).pop(),
                          onRightButtonPressed: () {
                            Navigator.of(context).pop();
                            context.read<IdeaTasksCubit>().taskDeleted(task);
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.close,
                      color: task.status == kIdeaStatusDone ? AppColors.grey : AppColors.white,
                    ),
                  ),
                ),
                ReorderableDragStartListener(
                  index: index,
                  child: GestureDetector(
                    onTap: () {
                      //Having an empty onTap call here, because user can accidentally press
                      //on the Icon to change status of Task, which can throw an error while being dragged
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.drag_indicator,
                        color: task.status == kIdeaStatusDone ? AppColors.grey : AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
