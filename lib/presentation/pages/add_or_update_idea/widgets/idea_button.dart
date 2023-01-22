import 'package:flutter/material.dart';

import '../../../../colors.dart';

class IdeaButton extends StatelessWidget {
  const IdeaButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            backgroundColor: AppColors.primaryForegroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
}
