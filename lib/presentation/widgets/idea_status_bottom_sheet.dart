import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/add_or_update_idea/add_or_update_idea_cubit.dart';
import '../../constants.dart';
import '../../styles.dart';

class IdeaStatusBottomSheet extends StatelessWidget {
  const IdeaStatusBottomSheet({Key? key}) : super(key: key);

  void statusTapped(String ideaStatus, BuildContext context) {
    context.read<AddOrUpdateIdeaCubit>().ideaStatusChanged(ideaStatus);
    Navigator.of(context).pop();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: const BoxDecoration(
          //TODO Apply colors
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //TODO Change Design
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
              color: Colors.black,
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
              color: Colors.black,
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
              color: Colors.black,
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
