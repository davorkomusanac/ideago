import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/idea_categories/idea_categories_cubit.dart';
import '../../../../application/ideas/ideas_cubit.dart';
import '../../../../application/rate_idea/rate_idea_cubit.dart';
import '../../../../constants.dart';
import '../../../../data/models/idea/idea.dart';
import '../../../widgets/idea_textfield.dart';
import '../../../widgets/idea_textfield_label.dart';
import '../../add_idea/widgets/discard_idea_button.dart';
import '../../add_idea/widgets/idea_button.dart';
import '../../add_idea/widgets/idea_categories_field.dart';
import '../../add_idea/widgets/idea_full_description_minimized.dart';
import '../../add_idea/widgets/idea_rating_field.dart';
import '../../add_idea/widgets/idea_status_field.dart';
import 'delete_idea_button.dart';

class UpdateIdeaAllFields extends StatelessWidget {
  const UpdateIdeaAllFields({
    required this.idea,
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

  final Idea idea;
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
              leftPadding: 68,
              label: kIdeaTextFieldTitleLabel,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                const DiscardIdeaButton(
                  content: kDiscardUpdateIdeaDialogContent,
                  icon: Icons.arrow_back,
                ),
                Expanded(
                  child: IdeaTextField(
                    controller: titleController,
                    hintText: kIdeaTextFieldTitleHint,
                    margin: const EdgeInsets.only(right: 8.0),
                  ),
                ),
                DeleteIdeaButton(idea: idea),
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
            ),

            const SizedBox(height: 24),
            IdeaButton(
              onPressed: () {
                switch (statusController.text) {
                  case kIdeaStatusInProgress:
                    context.read<InProgressIdeasCubit>().ideaUpdated(
                          uid: idea.uid,
                          title: titleController.text,
                          summary: summaryController.text,
                          fullDescription: fullDescriptionController.text,
                          status: statusController.text,
                          revenueExplanation: revenueController.text,
                          differentiationExplanation: differentiationController.text,
                          speedExplanation: speedController.text,
                          capitalExplanation: capitalController.text,
                          index: idea.index,
                          rating: context.read<RateIdeaCubit>().state.ratingsSum,
                          ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                          categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                          dateTimeCreated: idea.dateTimeCreated,
                        );
                    break;
                  case kIdeaStatusToDo:
                    context.read<ToDoIdeasCubit>().ideaUpdated(
                          uid: idea.uid,
                          title: titleController.text,
                          summary: summaryController.text,
                          fullDescription: fullDescriptionController.text,
                          status: statusController.text,
                          revenueExplanation: revenueController.text,
                          differentiationExplanation: differentiationController.text,
                          speedExplanation: speedController.text,
                          capitalExplanation: capitalController.text,
                          index: idea.index,
                          rating: context.read<RateIdeaCubit>().state.ratingsSum,
                          ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                          categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                          dateTimeCreated: idea.dateTimeCreated,
                        );
                    break;
                  case kIdeaStatusDone:
                    context.read<DoneIdeasCubit>().ideaUpdated(
                          uid: idea.uid,
                          title: titleController.text,
                          summary: summaryController.text,
                          fullDescription: fullDescriptionController.text,
                          status: statusController.text,
                          revenueExplanation: revenueController.text,
                          differentiationExplanation: differentiationController.text,
                          speedExplanation: speedController.text,
                          capitalExplanation: capitalController.text,
                          index: idea.index,
                          rating: context.read<RateIdeaCubit>().state.ratingsSum,
                          ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                          categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                          dateTimeCreated: idea.dateTimeCreated,
                        );
                    break;
                  case kIdeaStatusDiscarded:
                    context.read<DiscardedIdeasCubit>().ideaUpdated(
                          uid: idea.uid,
                          title: titleController.text,
                          summary: summaryController.text,
                          fullDescription: fullDescriptionController.text,
                          status: statusController.text,
                          revenueExplanation: revenueController.text,
                          differentiationExplanation: differentiationController.text,
                          speedExplanation: speedController.text,
                          capitalExplanation: capitalController.text,
                          index: idea.index,
                          rating: context.read<RateIdeaCubit>().state.ratingsSum,
                          ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                          categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                          dateTimeCreated: idea.dateTimeCreated,
                        );
                    break;
                }

                Navigator.of(context).pop();
              },
              text: kUpdateIdeaButtonText,
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}
