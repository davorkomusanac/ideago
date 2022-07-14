import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  const AdaptiveAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.leftButtonText,
    required this.rightButtonText,
    this.onLeftButtonPressed,
    this.onRightButtonPressed,
  }) : super(key: key);

  final String title;
  final String content;
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback? onLeftButtonPressed;
  final VoidCallback? onRightButtonPressed;

  @override
  Widget build(BuildContext context) => Platform.isIOS
      ? CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            CupertinoDialogAction(
              onPressed: onLeftButtonPressed,
              child: Text(leftButtonText),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: onRightButtonPressed,
              child: Text(rightButtonText),
            ),
          ],
        )
      : AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onLeftButtonPressed,
              child: Text(leftButtonText),
            ),
            TextButton(
              onPressed: onRightButtonPressed,
              child: Text(
                rightButtonText,
              ),
            ),
          ],
        );
}
