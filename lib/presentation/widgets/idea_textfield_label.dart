import 'package:flutter/material.dart';

import '../../colors.dart';

class IdeaTextFieldLabel extends StatelessWidget {
  final String label;
  final double leftPadding;
  final double bottomPadding;

  const IdeaTextFieldLabel({
    required this.label,
    this.leftPadding = 28.0,
    this.bottomPadding = 2.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          left: leftPadding,
          bottom: bottomPadding,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryForegroundColor,
            ),
          ),
        ),
      );
}
