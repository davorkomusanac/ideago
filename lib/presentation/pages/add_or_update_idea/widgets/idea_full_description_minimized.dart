import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/idea_text_fields_helpers/idea_text_fields_helpers_cubit.dart';
import '../../../../colors.dart';
import '../../../../constants.dart';
import '../../../widgets/idea_text_field.dart';

class IdeaFullDescriptionMinimized extends StatelessWidget {
  const IdeaFullDescriptionMinimized({
    Key? key,
    required this.fullDescriptionController,
    required this.descriptionFullScreenFocusNode,
  }) : super(key: key);

  final TextEditingController fullDescriptionController;
  final FocusNode descriptionFullScreenFocusNode;

  @override
  Widget build(BuildContext context) => Padding(
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
              right: 8,
              bottom: 8,
              child: InkWell(
                onTap: () {
                  descriptionFullScreenFocusNode.requestFocus();
                  context.read<IdeaTextFieldsHelpersCubit>().descriptionButtonPressed();
                },
                child: Container(
                  color: AppColors.primaryBackgroundColor,
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.fullscreen),
                ),
              ),
            ),
          ],
        ),
      );
}
