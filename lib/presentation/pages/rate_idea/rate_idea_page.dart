import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/rate_idea/rate_idea_cubit.dart';
import '../../../colors.dart';
import '../../../constants.dart';
import 'widgets/confirm_rating_button.dart';
import 'widgets/rate_idea_intro.dart';
import 'widgets/rate_idea_outro.dart';
import 'widgets/rate_idea_slider_header.dart';

class RateIdeaPage extends StatelessWidget {
  const RateIdeaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(kAppBarRateIdeaTitle),
        ),
        body: BlocBuilder<RateIdeaCubit, RateIdeaState>(
          builder: (context, state) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.questionRatings.length + 3,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const RateIdeaIntro();
              } else if (index == state.questionRatings.length + 1) {
                return const RateIdeaOutro();
              } else if (index == state.questionRatings.length + 2) {
                return ConfirmRatingButton(
                  onPressed: () => Navigator.of(context).pop(),
                );
              } else {
                var questionTitle = state.questionRatings[index - 1].title;
                var questionDescription = state.questionRatings[index - 1].description;
                var questionRating = state.questionRatings[index - 1].rating;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RichText(
                        text: TextSpan(
                          text: '$index. $questionTitle',
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          children: [
                            TextSpan(
                              text: ' - $questionDescription',
                              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    RateIdeaSliderHeader(currentSliderValue: questionRating),
                    Slider.adaptive(
                      value: questionRating.toDouble(),
                      min: 1,
                      max: 10,
                      divisions: 9,
                      activeColor: AppColors.primaryForegroundColor,
                      onChanged: (newRating) {
                        context.read<RateIdeaCubit>().rateQuestion(
                              questionIndex: index - 1,
                              questionRating: newRating.round(),
                            );
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      );
}
