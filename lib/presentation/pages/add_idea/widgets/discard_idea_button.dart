import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../widgets/adaptive_alert_dialog.dart';

class DiscardIdeaButton extends StatelessWidget {
  const DiscardIdeaButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        onPressed: () {
          showOkCancelAlertDialog(
            context: context,
            builder: (_, __) => AdaptiveAlertDialog(
              title: kAlertDialogConfirmationTitle,
              content: kDiscardCreateIdeaDialogContent,
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
        icon: const Icon(Icons.close),
      );
}
