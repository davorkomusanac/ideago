import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../application/idea_text_fields_helpers/idea_text_fields_helpers_cubit.dart';
import '../../../../colors.dart';
import '../../../../constants.dart';
import '../../../widgets/idea_status_bottom_sheet.dart';
import '../../../widgets/idea_text_field.dart';
import '../../../widgets/idea_text_field_label.dart';

class IdeaStatusField extends StatelessWidget {
  const IdeaStatusField({
    Key? key,
    required this.statusController,
  }) : super(key: key);

  final TextEditingController statusController;

  @override
  Widget build(BuildContext context) => BlocListener<IdeaTextFieldsHelpersCubit, IdeaTextFieldsHelpersState>(
        ///Implemented listenWhen because listener would get called whenever something changed in IdeaTextFieldsHelpers
        ///which would then change idea status if user expanded full description by default value (To Do value)
        listenWhen: (previous, current) => previous.ideaProjectStatus == current.ideaProjectStatus ? false : true,
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
                  color: AppColors.grey,
                ),
                onTap: () => showMaterialModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.transparentColor,
                  builder: (_) => BlocProvider<IdeaTextFieldsHelpersCubit>.value(
                    value: BlocProvider.of<IdeaTextFieldsHelpersCubit>(context),
                    child: const IdeaStatusBottomSheet(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
