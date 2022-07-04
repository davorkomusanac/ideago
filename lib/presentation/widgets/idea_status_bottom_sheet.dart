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
                onPressed: () => statusTapped(ideaStatusToDo, context),
                child: const Text(ideaStatusToDo),
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
                onPressed: () => statusTapped(ideaStatusInProgress, context),
                child: const Text(ideaStatusInProgress),
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
                onPressed: () => statusTapped(ideaStatusDone, context),
                child: const Text(ideaStatusDone),
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
                onPressed: () => statusTapped(ideaStatusDiscarded, context),
                child: const Text(ideaStatusDiscarded),
              ),
            ),
          ],
        ),
      );
}
