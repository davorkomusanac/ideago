import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../application/idea_categories/idea_categories_cubit.dart';
import '../../../../colors.dart';
import '../../add_idea_category/add_idea_category_bottom_sheet.dart';

class IdeaCategoriesField extends StatelessWidget {
  const IdeaCategoriesField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<IdeaCategoriesCubit, IdeaCategoriesState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: AppColors.secondaryForegroundColor,
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.read<IdeaCategoriesCubit>().allCategoriesLoaded();
                    showMaterialModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      backgroundColor: AppColors.transparentColor,
                      builder: (_) => BlocProvider<IdeaCategoriesCubit>.value(
                        value: BlocProvider.of<IdeaCategoriesCubit>(context),
                        child: const AddIdeaCategoryBottomSheet(),
                      ),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
                ...state.checkedCategories
                    .map(
                      (category) => Chip(
                        backgroundColor: AppColors.primaryForegroundColor,
                        elevation: 5,
                        label: Text(category),
                        onDeleted: () => context.read<IdeaCategoriesCubit>().ideaCategoryRemoved(category),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      );
}
