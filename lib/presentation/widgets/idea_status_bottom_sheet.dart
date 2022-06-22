import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/add_or_update_idea/add_or_update_idea_cubit.dart';
import '../../constants.dart';

class IdeaStatusBottomSheet extends StatelessWidget {
  const IdeaStatusBottomSheet({
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final AddOrUpdateIdeaCubit cubit;

  @override
  Widget build(BuildContext context) => BlocProvider<AddOrUpdateIdeaCubit>.value(
        value: cubit,
        child: Container(
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
            children: [
              //TODO Change Design
              //TODO remove focus
              InkWell(
                onTap: () {
                  cubit.ideaStatusChanged(ideaStatusToDo);
                  Navigator.of(context).pop();
                },
                child: const Text(ideaStatusToDo),
              ),
              InkWell(
                onTap: () {
                  cubit.ideaStatusChanged(ideaStatusInProgress);
                  Navigator.of(context).pop();
                },
                child: const Text(ideaStatusInProgress),
              ),
              InkWell(
                onTap: () {
                  cubit.ideaStatusChanged(ideaStatusDone);
                  Navigator.of(context).pop();
                },
                child: const Text(ideaStatusDone),
              ),
              InkWell(
                onTap: () {
                  cubit.ideaStatusChanged(ideaStatusDiscarded);
                  Navigator.of(context).pop();
                },
                child: const Text(ideaStatusDiscarded),
              ),
            ],
          ),
        ),
      );
}
