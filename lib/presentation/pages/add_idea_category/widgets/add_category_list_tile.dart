import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/idea_categories/idea_categories_cubit.dart';
import '../../../../colors.dart';

class AddCategoryListTile extends StatelessWidget {
  const AddCategoryListTile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              style: BorderStyle.solid,
              width: 1.0,
              color: AppColors.black.withOpacity(0.2),
            ),
          ),
        ),
        child: CheckboxListTile(
          value: false,
          onChanged: null,
          title: Text("\"$title\""),
          controlAffinity: ListTileControlAffinity.leading,
          secondary: Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: SizedBox(
              width: 44,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: AppColors.primaryForegroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () => context.read<IdeaCategoriesCubit>().categoryAdded(title),
                child: const Icon(Icons.add, size: 28),
              ),
            ),
          ),
        ),
      );
}
