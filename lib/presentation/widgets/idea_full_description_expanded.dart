import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/idea_text_fields_helpers/idea_text_fields_helpers_cubit.dart';
import '../../colors.dart';
import '../../constants.dart';
import 'idea_text_field.dart';
import 'idea_text_field_label.dart';

class IdeaFullDescriptionExpanded extends StatelessWidget {
  const IdeaFullDescriptionExpanded({
    Key? key,
    required this.fullDescriptionController,
    this.descriptionFullScreenFocusNode,
  }) : super(key: key);

  final TextEditingController fullDescriptionController;
  final FocusNode? descriptionFullScreenFocusNode;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          //A scrollview is needed to be able to dismiss keyboard on drag, CustomScrollView works with Expanded
          SliverFillRemaining(
            child: Column(
              children: [
                const IdeaTextFieldLabel(
                  leftPadding: 20,
                  label: kIdeaTextFieldFullDescriptionLabel,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    child: Stack(
                      children: [
                        IdeaTextField(
                          focusNode: descriptionFullScreenFocusNode,
                          controller: fullDescriptionController,
                          hintText: kIdeaTextFieldFullDescriptionHint,
                          minLines: null,
                          maxLines: null,
                          expands: true,
                          contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        ),
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: InkWell(
                            onTap: () => context.read<IdeaTextFieldsHelpersCubit>().descriptionButtonPressed(),
                            child: Container(
                              color: AppColors.primaryBackgroundColor,
                              padding: const EdgeInsets.all(6.0),
                              child: const Icon(Icons.fullscreen_exit),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
