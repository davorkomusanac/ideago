import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/idea_categories/idea_categories_cubit.dart';
import '../../../../../application/idea_tasks/idea_tasks_cubit.dart';
import '../../../../../application/ideas/ideas_cubit.dart';
import '../../../../../application/rate_idea/rate_idea_cubit.dart';
import '../../../../../constants.dart';
import '../../../../widgets/idea_text_field.dart';
import '../../../../widgets/idea_text_field_label.dart';
import '../../idea_tasks/idea_tasks.dart';
import '../../widgets/discard_idea_button.dart';
import '../../widgets/idea_button.dart';
import '../../widgets/idea_categories_field.dart';
import '../../widgets/idea_full_description_minimized.dart';
import '../../widgets/idea_rating_field.dart';
import '../../widgets/idea_status_field.dart';

class AddIdeaAllFields extends StatelessWidget {
  const AddIdeaAllFields({
    required this.titleController,
    required this.summaryController,
    required this.fullDescriptionController,
    required this.statusController,
    required this.ratingController,
    required this.descriptionFullScreenFocusNode,
    required this.revenueController,
    required this.differentiationController,
    required this.speedController,
    required this.capitalController,
    Key? key,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController summaryController;
  final TextEditingController fullDescriptionController;
  final TextEditingController statusController;
  final TextEditingController ratingController;
  final TextEditingController revenueController;
  final TextEditingController differentiationController;
  final TextEditingController speedController;
  final TextEditingController capitalController;
  final FocusNode descriptionFullScreenFocusNode;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            ///
            ///Title
            ///
            const SizedBox(height: 10),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldTitleLabel,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: IdeaTextField(
                    controller: titleController,
                    hintText: kIdeaTextFieldTitleHint,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    autofocus: true,
                    maxLines: 2,
                  ),
                ),
                const DiscardIdeaButton(
                  content: kDiscardCreateIdeaDialogContent,
                  icon: Icons.close,
                ),
                const SizedBox(width: 8),
              ],
            ),

            ///
            ///Summary
            ///
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldSummaryLabel,
            ),
            IdeaTextField(
              controller: summaryController,
              hintText: kIdeaTextFieldSummaryHint,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              maxLines: 2,
            ),

            ///
            ///Description
            ///
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldFullDescriptionLabel,
            ),
            IdeaFullDescriptionMinimized(
              fullDescriptionController: fullDescriptionController,
              descriptionFullScreenFocusNode: descriptionFullScreenFocusNode,
            ),

            ///
            ///Tasks
            ///
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldTasks,
            ),
            const IdeaTasks(),

            ///
            ///Status and Rating
            ///
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IdeaStatusField(statusController: statusController),
                  const SizedBox(width: 26),
                  IdeaRatingField(ratingController: ratingController),
                ],
              ),
            ),

            ///
            ///Categories
            ///
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldCategories,
            ),
            const IdeaCategoriesField(),

            ///
            ///Revenue
            ///
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldHowAreYouGoingToEarnMoneyLabel,
            ),
            IdeaTextField(
              controller: revenueController,
              hintText: kIdeaTextFieldHowAreYouGoingToEarnMoneyHint,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              maxLines: 2,
            ),

            ///
            ///Differentiation
            ///
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldHowAreYouDifferentLabel,
            ),
            IdeaTextField(
              controller: differentiationController,
              hintText: kIdeaTextFieldHowAreYouDifferentHint,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              maxLines: 2,
            ),

            ///
            ///Speed
            ///
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldHowFastToLaunchLabel,
            ),
            IdeaTextField(
              controller: speedController,
              hintText: kIdeaTextFieldHowFastToLaunchHint,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              maxLines: 2,
            ),

            ///
            ///Capital
            ///
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldHowMuchTimeAndMoneyNeededLabel,
            ),
            IdeaTextField(
              controller: capitalController,
              hintText: kIdeaTextFieldHowMuchTimeAndMoneyNeededHint,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              maxLines: 2,
            ),

            const SizedBox(height: 24),
            IdeaButton(
              onPressed: () {
                switch (statusController.text) {
                  case kIdeaStatusInProgress:
                    context.read<InProgressIdeasCubit>().ideaAdded(
                          title: titleController.text,
                          summary: summaryController.text,
                          fullDescription: fullDescriptionController.text,
                          status: statusController.text,
                          revenueExplanation: revenueController.text,
                          differentiationExplanation: differentiationController.text,
                          speedExplanation: speedController.text,
                          capitalExplanation: capitalController.text,
                          rating: context.read<RateIdeaCubit>().state.ratingsSum,
                          ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                          categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                          tasks: context.read<IdeaTasksCubit>().state.tasks,
                        );
                    break;
                  case kIdeaStatusToDo:
                    context.read<ToDoIdeasCubit>().ideaAdded(
                          title: titleController.text,
                          summary: summaryController.text,
                          fullDescription: fullDescriptionController.text,
                          status: statusController.text,
                          revenueExplanation: revenueController.text,
                          differentiationExplanation: differentiationController.text,
                          speedExplanation: speedController.text,
                          capitalExplanation: capitalController.text,
                          rating: context.read<RateIdeaCubit>().state.ratingsSum,
                          ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                          categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                          tasks: context.read<IdeaTasksCubit>().state.tasks,
                        );
                    break;
                  case kIdeaStatusDone:
                    context.read<DoneIdeasCubit>().ideaAdded(
                          title: titleController.text,
                          summary: summaryController.text,
                          fullDescription: fullDescriptionController.text,
                          status: statusController.text,
                          revenueExplanation: revenueController.text,
                          differentiationExplanation: differentiationController.text,
                          speedExplanation: speedController.text,
                          capitalExplanation: capitalController.text,
                          rating: context.read<RateIdeaCubit>().state.ratingsSum,
                          ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                          categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                          tasks: context.read<IdeaTasksCubit>().state.tasks,
                        );
                    break;
                  case kIdeaStatusDiscarded:
                    context.read<DiscardedIdeasCubit>().ideaAdded(
                          title: titleController.text,
                          summary: summaryController.text,
                          fullDescription: fullDescriptionController.text,
                          status: statusController.text,
                          revenueExplanation: revenueController.text,
                          differentiationExplanation: differentiationController.text,
                          speedExplanation: speedController.text,
                          capitalExplanation: capitalController.text,
                          rating: context.read<RateIdeaCubit>().state.ratingsSum,
                          ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                          categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                          tasks: context.read<IdeaTasksCubit>().state.tasks,
                        );
                    break;
                }

                Navigator.of(context).pop();
              },
              text: kCreateIdeaButtonText,
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}
