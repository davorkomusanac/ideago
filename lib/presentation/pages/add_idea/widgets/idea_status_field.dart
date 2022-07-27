import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../application/add_or_update_idea/add_or_update_idea_cubit.dart';
import '../../../../constants.dart';
import '../../../widgets/idea_status_bottom_sheet.dart';
import '../../../widgets/idea_textfield.dart';
import '../../../widgets/idea_textfield_label.dart';

class IdeaStatusField extends StatelessWidget {
  const IdeaStatusField({
    Key? key,
    required this.statusController,
  }) : super(key: key);

  final TextEditingController statusController;

  @override
  Widget build(BuildContext context) => BlocListener<AddOrUpdateIdeaCubit, AddOrUpdateIdeaState>(
        listener: (context, state) {
          if (state.ideaProjectStatus != statusController.text) {
            statusController.text = state.ideaProjectStatus;
          }
        },
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const IdeaTextFieldLabel(
                label: kIdeaTextFieldStatus,
                leftPadding: 12.0,
              ),
              IdeaTextField(
                controller: statusController,
                readOnly: true,
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                ),
                onTap: () => showMaterialModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (_) => BlocProvider<AddOrUpdateIdeaCubit>.value(
                    value: BlocProvider.of<AddOrUpdateIdeaCubit>(context),
                    child: const IdeaStatusBottomSheet(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
