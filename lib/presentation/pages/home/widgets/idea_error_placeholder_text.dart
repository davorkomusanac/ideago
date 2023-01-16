import 'package:flutter/material.dart';

class IdeaErrorPlaceholderText extends StatelessWidget {
  const IdeaErrorPlaceholderText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 2,
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
        ],
      );
}
