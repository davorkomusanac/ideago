import 'package:flutter/material.dart';

class RateIdeaSliderHeader extends StatelessWidget {
  const RateIdeaSliderHeader({
    Key? key,
    required this.currentSliderValue,
  }) : super(key: key);

  final int currentSliderValue;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '1',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 1.5),
                ),
              ),
              child: Text(
                currentSliderValue.round().toString(),
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const Text(
              '10',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ],
        ),
      );
}
