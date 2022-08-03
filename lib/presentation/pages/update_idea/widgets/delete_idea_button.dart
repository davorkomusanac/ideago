import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/ideas/ideas_cubit.dart';
import '../../../../colors.dart';
import '../../../../constants.dart';
import '../../../../data/models/idea/idea.dart';
import '../../../widgets/adaptive_alert_dialog.dart';

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
                context.read<IdeasCubit>().ideaDeleted(idea: idea);
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
