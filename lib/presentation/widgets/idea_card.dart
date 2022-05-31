import 'package:flutter/material.dart';
import 'package:ideago/data/models/idea.dart';

class IdeaCard extends StatelessWidget {
  final Idea idea;

  const IdeaCard({required this.idea, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Text(idea.title);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Container(
        color: Colors.red,
        height: 200,
        child: Column(
          children: [
            Text(idea.title),
            Text(idea.description),
            Row(
              children: idea.categories
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        label: Text(e),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
