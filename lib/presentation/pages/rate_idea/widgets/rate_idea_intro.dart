import 'package:flutter/material.dart';

class RateIdeaIntro extends StatelessWidget {
  const RateIdeaIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Rate each of the',
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                        text: ' 10 questions ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: 'below on a scale from '),
                      TextSpan(text: '1 to 10', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(text: ', where '),
                      TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(text: ' is extremely '),
                      TextSpan(text: 'unattractive', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(text: ' and '),
                      TextSpan(text: '10', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(text: ' is extremely '),
                      TextSpan(text: 'attractive.', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(text: ' When in doubt, be conservative in rating.'),
                    ],
                  ),
                ),
                const Text(
                  '\nYou can also rate the idea later or even rate it again.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.8,
            indent: 12,
            endIndent: 12,
          ),
        ],
      );
}
