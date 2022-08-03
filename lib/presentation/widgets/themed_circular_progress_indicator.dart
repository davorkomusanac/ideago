import 'package:flutter/material.dart';

import '../../colors.dart';

class ThemedCircularProgressIndicator extends StatelessWidget {
  const ThemedCircularProgressIndicator({
    this.padding = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryForegroundColor,
          ),
        ),
      );
}
