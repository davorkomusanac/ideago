import 'package:flutter/material.dart';

class LoadNextPageIndicator extends StatelessWidget {
  const LoadNextPageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
