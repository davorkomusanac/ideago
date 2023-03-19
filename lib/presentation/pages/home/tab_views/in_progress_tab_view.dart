import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/ideas/idea_tab_view_helper/idea_tab_view_helper_cubit.dart';
import '../../../../application/ideas/ideas_cubit.dart';
import '../../../../constants.dart';
import '../../../../functions.dart';
import '../../../widgets/themed_circular_progress_indicator.dart';
import '../widgets/idea_card.dart';
import '../widgets/idea_card_grid_view.dart';
import '../widgets/idea_error_placeholder_text.dart';

///Similar to rest of the IdeaTabViews, but have to duplicate code to be able to call appropriate cubit
class InProgressTabView extends StatelessWidget {
  const InProgressTabView({
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => BlocConsumer<InProgressIdeasCubit, IdeasState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == IdeasStatus.loading) {
            return const ThemedCircularProgressIndicator();
          } else if (state.status == IdeasStatus.error && state.errorMessageLoadingIdeas == kErrorLoadingIdeas) {
            return IdeaErrorPlaceholderText(text: state.errorMessageLoadingIdeas);
          } else if (state.status == IdeasStatus.success && state.ideas.isEmpty) {
            return state.searchTerm.isEmpty
                ? const IdeaErrorPlaceholderText(text: kNoIdeasCreatedYet)
                : const IdeaErrorPlaceholderText(text: kNoIdeasFound);
          } else {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollEndNotification && scrollController.position.extentAfter == 0) {
                  context.read<InProgressIdeasCubit>().fetchedIdeasNextPage(state.ideas.length);
                }
                return false;
              },
              child: BlocBuilder<IdeaTabViewHelperCubit, IdeaTabViewHelperState>(
                builder: (_, tabViewState) => tabViewState.isListViewSelected
                    ? ListView.builder(
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        controller: scrollController,
                        itemCount: state.isThereMoreIdeasToLoad ? state.ideas.length + 1 : state.ideas.length,
                        itemBuilder: (context, index) => index >= state.ideas.length
                            ? const ThemedCircularProgressIndicator(
                                padding: EdgeInsets.all(8.0),
                              )
                            : IdeaCard(
                                idea: state.ideas[index],
                                key: ValueKey(
                                  state.ideas[index].uid,
                                ),
                              ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GridView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          controller: scrollController,
                          gridDelegate: fixedHeightSliverGridViewDelegate(),
                          itemCount: state.isThereMoreIdeasToLoad ? state.ideas.length + 1 : state.ideas.length,
                          itemBuilder: (context, index) => index >= state.ideas.length
                              ? const ThemedCircularProgressIndicator(
                                  padding: EdgeInsets.all(8.0),
                                )
                              : IdeaCardGridView(
                                  idea: state.ideas[index],
                                  key: ValueKey(
                                    state.ideas[index].uid,
                                  ),
                                ),
                        ),
                      ),
              ),
            );
          }
        },
      );
}
