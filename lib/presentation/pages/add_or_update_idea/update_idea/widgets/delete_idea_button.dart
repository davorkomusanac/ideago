import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/ideas/ideas_cubit.dart';
import '../../../../../colors.dart';
import '../../../../../constants.dart';
import '../../../../../data/models/idea/idea.dart';
import '../../../../widgets/adaptive_alert_dialog.dart';

class DeleteIdeaButton extends StatelessWidget {
  const DeleteIdeaButton({
    Key? key,
    required this.idea,
  }) : super(key: key);

  final Idea idea;

  @override
  Widget build(BuildContext context) => IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        onPressed: () {
          // ignore: unused_result
          showOkCancelAlertDialog(
            context: context,
            builder: (_, __) => AdaptiveAlertDialog(
              title: kAlertDialogConfirmationTitle,
              content: kDeleteIdeaDialogContent,
              leftButtonText: kAlertDialogLeftButtonText,
              rightButtonText: kDeleteIdeaDialogRightButtonText,
              onLeftButtonPressed: () => Navigator.of(context).pop(),
              onRightButtonPressed: () {
                //Pop until home page
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                switch (idea.status) {
                  case kIdeaStatusInProgress:
                    context.read<InProgressIdeasCubit>().ideaDeleted(idea: idea);
                    break;
                  case kIdeaStatusToDo:
                    context.read<ToDoIdeasCubit>().ideaDeleted(idea: idea);
                    break;
                  case kIdeaStatusDone:
                    context.read<DoneIdeasCubit>().ideaDeleted(idea: idea);
                    break;
                  case kIdeaStatusDiscarded:
                    context.read<DiscardedIdeasCubit>().ideaDeleted(idea: idea);
                    break;
                }
              },
            ),
          );
          FocusManager.instance.primaryFocus?.unfocus();
        },
        icon: const Icon(
          Icons.delete,
          color: AppColors.primaryForegroundColor,
        ),
      );
}
