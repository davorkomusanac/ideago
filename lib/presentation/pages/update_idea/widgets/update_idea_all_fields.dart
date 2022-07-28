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
    Key? key,
  }) : super(key: key);

  final Idea idea;
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IdeaTextField(
                      controller: titleController,
                      hintText: kIdeaTextFieldTitleHint,
                    ),
                  ),
                ),
                DeleteIdeaButton(idea: idea),
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
            IdeaFullDescriptionMinimized(
              fullDescriptionController: fullDescriptionController,
              descriptionFullScreenFocusNode: descriptionFullScreenFocusNode,
            ),
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
            const SizedBox(height: 24),
            const IdeaTextFieldLabel(
              label: kIdeaTextFieldCategories,
            ),
            const IdeaCategoriesField(),
            const SizedBox(height: 16),
            IdeaButton(
              onPressed: () {
                context.read<IdeasCubit>().ideaUpdated(
                      uid: idea.uid,
                      title: titleController.text,
                      summary: summaryController.text,
                      fullDescription: fullDescriptionController.text,
                      status: statusController.text,
                      index: idea.index,
                      rating: context.read<RateIdeaCubit>().state.ratingsSum,
                      ratingQuestions: context.read<RateIdeaCubit>().state.questionRatings,
                      categories: context.read<IdeaCategoriesCubit>().state.checkedCategories,
                      dateTimeCreated: idea.dateTimeCreated,
                    );
                Navigator.of(context).pop();
              },
              text: kUpdateIdeaButtonText,
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}