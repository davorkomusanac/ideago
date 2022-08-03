import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/idea_text_fields_helpers/idea_text_fields_helpers_cubit.dart';
import '../../colors.dart';
import '../../constants.dart';
import '../../styles.dart';

class IdeaStatusBottomSheet extends StatelessWidget {
  const IdeaStatusBottomSheet({Key? key}) : super(key: key);

  void statusTapped(String ideaStatus, BuildContext context) {
    context.read<IdeaTextFieldsHelpersCubit>().ideaStatusChanged(ideaStatus);
    Navigator.of(context).pop();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: const BoxDecoration(
          color: AppColors.primaryBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(
                style: ideaStatusBottomSheetStyle,
                onPressed: () => statusTapped(kIdeaStatusToDo, context),
                child: const Text(kIdeaStatusToDo),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: AppColors.grey,
            ),
            Expanded(
              child: TextButton(
                style: ideaStatusBottomSheetStyle,
                onPressed: () => statusTapped(kIdeaStatusInProgress, context),
                child: const Text(kIdeaStatusInProgress),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: AppColors.grey,
            ),
            Expanded(
              child: TextButton(
                style: ideaStatusBottomSheetStyle,
                onPressed: () => statusTapped(kIdeaStatusDone, context),
                child: const Text(kIdeaStatusDone),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: AppColors.grey,
            ),
            Expanded(
              child: TextButton(
                style: ideaStatusBottomSheetStyle,
                onPressed: () => statusTapped(kIdeaStatusDiscarded, context),
                child: const Text(kIdeaStatusDiscarded),
              ),
            ),
          ],
        ),
      );
}
