import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../application/add_or_update_idea/add_or_update_idea_cubit.dart';
import '../../../../application/idea_categories/idea_categories_cubit.dart';
import '../../../../application/ideas/ideas_cubit.dart';
import '../../../../application/rate_idea/rate_idea_cubit.dart';
import '../../../../constants.dart';
import '../../../../functions.dart';
import '../../../widgets/idea_status_bottom_sheet.dart';
import '../../../widgets/idea_textfield.dart';
import '../../../widgets/idea_textfield_label.dart';
import '../../add_idea_category/add_idea_category_bottom_sheet.dart';
import '../../rate_idea/rate_idea_page.dart';
import 'discard_idea_button.dart';

class AddIdeaAllFields extends StatelessWidget {
  const AddIdeaAllFields({
    required this.titleController,
    required this.summaryController,
    required this.fullDescriptionController,
    required this.statusController,
    required this.ratingController,
    required this.descriptionFullScreenFocusNode,
    Key? key,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController summaryController;
  final TextEditingController fullDescriptionController;
  final TextEditingController statusController;
  final TextEditingController ratingController;
  final FocusNode descriptionFullScreenFocusNode;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldTitleLabel,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: IdeaTextField(
                      controller: titleController,
                      hintText: kIdeaTextFieldTitleHint,
                      autofocus: true,
                    ),
                  ),
                ),
                const DiscardIdeaButton(),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldSummaryLabel,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IdeaTextField(
                controller: summaryController,
                hintText: kIdeaTextFieldSummaryHint,
              ),
            ),
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldFullDescriptionLabel,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  IdeaTextField(
                    controller: fullDescriptionController,
                    hintText: kIdeaTextFieldFullDescriptionHint,
                    minLines: 10,
                    maxLines: 10,
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 20, 12),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        descriptionFullScreenFocusNode.requestFocus();
                        context.read<AddOrUpdateIdeaCubit>().descriptionButtonPressed();
                      },
                      icon: const Icon(Icons.fullscreen),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  BlocListener<AddOrUpdateIdeaCubit, AddOrUpdateIdeaState>(
                    listener: (context, state) {
                      if (state.ideaProjectStatus != statusController.text) {
                        statusController.text = state.ideaProjectStatus;
                      }
                    },
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const IdeaTextFieldLabel(
                            label: kIdeaTextFieldStatus,
                            leftPadding: 12.0,
                          ),
                          IdeaTextField(
                            controller: statusController,
                            readOnly: true,
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                            ),
                            onTap: () => showMaterialModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (_) => BlocProvider<AddOrUpdateIdeaCubit>.value(
                                value: BlocProvider.of<AddOrUpdateIdeaCubit>(context),
                                child: const IdeaStatusBottomSheet(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 26),
                  BlocListener<RateIdeaCubit, RateIdeaState>(
                    listener: (context, state) {
                      ratingController.text = formatIdeaRatingResult(state.ratingsSum);
                    },
                    child: Expanded(
                      child: Column(
                        children: [
                          const IdeaTextFieldLabel(
                            label: kIdeaTextFieldRatingTitle,
                            leftPadding: 12.0,
                          ),
                          IdeaTextField(
                            controller: ratingController,
                            readOnly: true,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider<RateIdeaCubit>.value(
                                    value: BlocProvider.of<RateIdeaCubit>(context),
                                    child: const RateIdeaPage(),
                                  ),
                                ),
                              );
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldCategories,
            ),
            BlocBuilder<IdeaCategoriesCubit, IdeaCategoriesState>(
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
                            backgroundColor: Colors.transparent,
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
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  context.read<IdeasCubit>().ideaAdded(
                        title: titleController.text,
                        summary: summaryController.text,
                        fullDescription: fullDescriptionController.text,
                        status: statusController.text,
                        rating: context.read<RateIdeaCubit>().state.ratingsSum,
                        ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                        categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                      );
                  Navigator.of(context).pop();
                },
                child: const Text(kCreateIdeaButtonText),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}
