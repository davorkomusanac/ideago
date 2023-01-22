import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../colors.dart';
import '../../../../constants.dart';
import '../../../widgets/adaptive_alert_dialog.dart';

class DiscardIdeaButton extends StatelessWidget {
  const DiscardIdeaButton({
    Key? key,
    required this.content,
    required this.icon,
  }) : super(key: key);

  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) => IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        onPressed: () {
          showOkCancelAlertDialog(
            context: context,
            builder: (_, __) => AdaptiveAlertDialog(
              title: kAlertDialogConfirmationTitle,
              content: content,
              leftButtonText: kAlertDialogLeftButtonText,
              rightButtonText: kAlertDialogRightButtonText,
              onLeftButtonPressed: () => Navigator.of(context).pop(),
              onRightButtonPressed: () {
                //Pop until home page
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          );
          FocusManager.instance.primaryFocus?.unfocus();
        },
        icon: Icon(
          icon,
          color: AppColors.primaryForegroundColor,
        ),
      );
}
