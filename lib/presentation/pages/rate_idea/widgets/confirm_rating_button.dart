import 'package:flutter/material.dart';

import '../../../../colors.dart';
import '../../../../constants.dart';

class ConfirmRatingButton extends StatelessWidget {
  const ConfirmRatingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Align(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryForegroundColor,
              ),
              onPressed: onPressed,
              child: const Text(kAppBarRateIdeaTitle),
            ),
          ),
        ),
      );
}
