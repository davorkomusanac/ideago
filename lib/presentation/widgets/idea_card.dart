import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../data/models/idea/idea.dart';
import '../pages/update_idea/update_idea_page.dart';

class IdeaCard extends StatelessWidget {
  final Idea idea;

  const IdeaCard({required this.idea, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UpdateIdeaPage(idea: idea),
            ),
          ),
          child: AnimatedContainer(
            color: AppColors.primaryForegroundColor,
            height: 200,
            duration: const Duration(seconds: 15),
            child: Column(
              children: [
                Text(idea.title),
                Text(idea.summary),
                Text(idea.fullDescription),
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
        ),
      );
}
