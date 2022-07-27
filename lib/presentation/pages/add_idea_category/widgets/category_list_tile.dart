import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/idea_categories/idea_categories_cubit.dart';
import '../../../../constants.dart';
import '../../../../data/models/idea_category/idea_category.dart';
import '../../../widgets/adaptive_alert_dialog.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({Key? key, required this.category}) : super(key: key);

  final IdeaCategory category;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              style: BorderStyle.solid,
              width: 1.0,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
        child: CheckboxListTile(
          value: category.isChecked,
          onChanged: (val) {
            if (val != null) {
              val
                  ? context.read<IdeaCategoriesCubit>().categoryChecked(category)
                  : context.read<IdeaCategoriesCubit>().categoryUnchecked(category);
            }
          },
          title: Text(category.title),
          controlAffinity: ListTileControlAffinity.leading,
          secondary: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            clipBehavior: Clip.hardEdge,
            child: IconButton(
              onPressed: () {
                //Dismiss keyboard
                FocusManager.instance.primaryFocus?.unfocus();

                showOkCancelAlertDialog(
                  context: context,
                  builder: (_, __) => AdaptiveAlertDialog(
                    title: kAlertDialogConfirmationTitle,
                    content: kDeleteCategoryDialogContent,
                    leftButtonText: kAlertDialogLeftButtonText,
                    rightButtonText: kAlertDialogRightButtonText,
                    onLeftButtonPressed: () => Navigator.of(context).pop(),
                    onRightButtonPressed: () {
                      Navigator.of(context).pop();
                      context.read<IdeaCategoriesCubit>().categoryDeleted(category);
                    },
                  ),
                );
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      );
}
