import 'package:flutter/material.dart';

class ConfirmRatingButton extends StatelessWidget {
  const ConfirmRatingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Align(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.teal),
              onPressed: onPressed,
              child: const Text("Rate Idea"),
            ),
          ),
        ),
      );
}
