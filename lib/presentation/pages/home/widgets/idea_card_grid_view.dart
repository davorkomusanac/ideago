import 'package:flutter/material.dart';

import '../../../../colors.dart';
import '../../../../data/models/idea/idea.dart';
import '../../../../functions.dart';
import '../../update_idea/update_idea_page.dart';
import 'idea_card_categories_chip.dart';

class IdeaCardGridView extends StatelessWidget {
  final Idea idea;

  const IdeaCardGridView({required this.idea, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UpdateIdeaPage(idea: idea),
          ),
        ),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryForegroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                if (idea.title.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                      left: 12,
                      right: 12,
                    ),
                    child: Text(
                      idea.title,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                if (idea.summary.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                      left: 12,
                      right: 12,
                    ),
                    child: Text(
                      idea.summary,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                if (idea.categories.isNotEmpty)
                  LayoutBuilder(
                    builder: (context, constraints) => Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        children: formatCategoriesToRenderForIdeaCard(
                                categories: idea.categories, maxWidth: constraints.maxWidth)
                            .map(
                              (e) => IdeaCardCategoriesChip(category: e),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        maxWidth: 200,
                      ),
                      decoration: BoxDecoration(
                        color: showIdeaRatingColor(idea.rating),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        formatIdeaRatingResult(idea.rating),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
