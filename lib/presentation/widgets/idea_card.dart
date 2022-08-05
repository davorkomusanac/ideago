import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../data/models/idea/idea.dart';
import '../../functions.dart';
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
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.24,
              decoration: BoxDecoration(
                color: AppColors.primaryForegroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 32.0,
                        ),
                        child: Text(
                          idea.title,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Text(
                          idea.summary,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxWidth: 200,
                                ),
                                child: Text(
                                  idea.status,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: showStatusColor(idea.status),
                                    decoration: showStatusTextDecoration(idea.status),
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 100,
                                    maxWidth: 200,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.red,
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Wrap(
                                clipBehavior: Clip.hardEdge,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10,
                                children: idea.categories
                                    .map(
                                      (e) => Chip(
                                        elevation: 5,
                                        backgroundColor: AppColors.grey,
                                        label: Text(e),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
