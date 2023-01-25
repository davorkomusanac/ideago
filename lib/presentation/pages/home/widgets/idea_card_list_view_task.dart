import 'package:flutter/material.dart';

import '../../../../colors.dart';
import '../../../../constants.dart';
import '../../../../data/models/task/task.dart';

class IdeaCardListViewTask extends StatelessWidget {
  const IdeaCardListViewTask({
    required this.task,
    Key? key,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) => IgnorePointer(
        //Wrapped with IgnorePointer so that user goes directly to update idea page when pressing inside Idea Card
        child: CheckboxListTile(
          //Currently the app is supporting that a Task can only have a checked and unchecked status
          //In the future it will have 4 different statuses like Ideas, but for right now, To Do will served as unchecked, and Done as checked
          value: task.status == kIdeaStatusDone,
          activeColor: AppColors.grey,
          contentPadding: const EdgeInsets.symmetric(horizontal: 6.0),
          onChanged: (_) {},
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.status == kIdeaStatusDone ? TextDecoration.lineThrough : null,
              color: task.status == kIdeaStatusDone ? AppColors.grey : AppColors.white,
              fontSize: 14,
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          visualDensity: VisualDensity.compact,
        ),
      );
}
