import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/idea_text_fields_helpers/idea_text_fields_helpers_cubit.dart';
import '../../constants.dart';
import 'idea_text_field.dart';
import 'idea_text_field_label.dart';

class IdeaFullDescriptionExpanded extends StatelessWidget {
  const IdeaFullDescriptionExpanded({
    Key? key,
    required this.fullDescriptionController,
    required this.descriptionFullScreenFocusNode,
  }) : super(key: key);

  final TextEditingController fullDescriptionController;
  final FocusNode descriptionFullScreenFocusNode;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          //A scrollview is needed to be able to dismiss keyboard on drag, CustomScrollView works with Expanded
          SliverFillRemaining(
            child: Column(
              children: [
                const IdeaTextFieldLabel(
                  label: kIdeaTextFieldFullDescriptionLabel,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
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
                          contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 36),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () => context.read<IdeaTextFieldsHelpersCubit>().descriptionButtonPressed(),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(Icons.fullscreen_exit),
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
