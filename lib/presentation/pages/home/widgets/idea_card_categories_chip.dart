import 'package:flutter/material.dart';

import '../../../../colors.dart';

class IdeaCardCategoriesChip extends StatelessWidget {
  const IdeaCardCategoriesChip({
    required this.category,
    Key? key,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.secondaryForegroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              category,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
}
