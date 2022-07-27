import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/rate_idea/rate_idea_cubit.dart';
import '../../../../constants.dart';
import '../../../../functions.dart';
import '../../../widgets/idea_textfield.dart';
import '../../../widgets/idea_textfield_label.dart';
import '../../rate_idea/rate_idea_page.dart';

class IdeaRatingField extends StatelessWidget {
  const IdeaRatingField({
    Key? key,
    required this.ratingController,
  }) : super(key: key);

  final TextEditingController ratingController;

  @override
  Widget build(BuildContext context) => BlocListener<RateIdeaCubit, RateIdeaState>(
        listener: (context, state) {
          ratingController.text = formatIdeaRatingResult(state.ratingsSum);
        },
        child: Expanded(
          child: Column(
            children: [
              const IdeaTextFieldLabel(
                label: kIdeaTextFieldRatingTitle,
                leftPadding: 12.0,
              ),
              IdeaTextField(
                controller: ratingController,
                readOnly: true,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider<RateIdeaCubit>.value(
                        value: BlocProvider.of<RateIdeaCubit>(context),
                        child: const RateIdeaPage(),
                      ),
                    ),
                  );
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ],
          ),
        ),
      );
}
