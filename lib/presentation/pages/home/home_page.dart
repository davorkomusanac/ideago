import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ideas/ideas_cubit.dart';
import '../../../constants.dart';
import '../../../functions.dart';
import '../../widgets/idea_card.dart';
import '../../widgets/idea_error_placeholder_text.dart';
import '../../widgets/load_next_page_indicator.dart';
import '../add_idea/add_idea_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _debouncer = Debouncer(milliseconds: 500);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: const Text('IdeaGo'),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddIdeaPage(),
            ),
          ),
          child: const Text('+'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) => _debouncer.run(
                () => context.read<IdeasCubit>().ideaSearched(
                      val.trim(),
                    ),
              ),
              decoration: const InputDecoration(
                hintText: kAddCategoryTextFieldHintText,
              ),
            ),
            Expanded(
              child: BlocConsumer<IdeasCubit, IdeasState>(
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == IdeasStatus.error &&
                      state.errorMessageLoadingIdeas == kErrorLoadingIdeas) {
                    return IdeaErrorPlaceholderText(text: state.errorMessageLoadingIdeas);
                  } else if (state.status == IdeasStatus.success && state.ideas.isEmpty) {
                    return state.searchTerm.isEmpty
                        ? const IdeaErrorPlaceholderText(text: kNoIdeasCreatedYet)
                        : const IdeaErrorPlaceholderText(text: kNoIdeasFound);
                  } else {
                    return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification && _scrollController.position.extentAfter == 0) {
                          context.read<IdeasCubit>().fetchedIdeasNextPage(state.ideas.length);
                        }
                        return false;
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: state.isThereMoreIdeasToLoad ? state.ideas.length + 1 : state.ideas.length,
                        itemBuilder: (context, index) => index >= state.ideas.length
                            ? const LoadNextPageIndicator()
                            : IdeaCard(
                                idea: state.ideas[index],
                                key: ValueKey(
                                  state.ideas[index].uid,
                                ),
                              ),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      );
}
