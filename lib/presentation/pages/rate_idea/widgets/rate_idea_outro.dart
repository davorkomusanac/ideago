import 'package:flutter/material.dart';

import '../../../../colors.dart';

class RateIdeaOutro extends StatelessWidget {
  const RateIdeaOutro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Divider(
            thickness: 0.8,
            indent: 12,
            endIndent: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'When you are done with rating your idea, press the button and check your score.\n\n',
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(text: 'If the score is '),
                      TextSpan(
                        text: 'under',
                        style: TextStyle(fontWeight: FontWeight.w600, backgroundColor: AppColors.red),
                      ),
                      TextSpan(
                        text: ' 50',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                          text:
                              ' - move on to another idea, there are better ideas worth your time.\n\nIf the score is '),
                      TextSpan(
                        text: 'between',
                        style: TextStyle(fontWeight: FontWeight.w600, backgroundColor: AppColors.orange),
                      ),
                      TextSpan(text: ' 50', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(text: ' and '),
                      TextSpan(text: '75', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(
                          text:
                              ', your idea has the potential to pay the bills if you put in the effort, but it might require some major changes.\n\nIf your score is '),
                      TextSpan(
                        text: 'above',
                        style: TextStyle(fontWeight: FontWeight.w600, backgroundColor: AppColors.green),
                      ),
                      TextSpan(text: ' 75', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(text: ', then you have hit a potential goldmine and go full steam ahead with it.'),
                    ],
                  ),
                ),
                const Text(
                  '\nYou can always rate your idea again if something changes.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      );
}
