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
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 16.0,
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          //TODO Style it
                          child: TextField(
                            onChanged: (val) => _debouncer.run(
                              () => context.read<IdeasCubit>().ideaSearched(
                                    val.trim(),
                                  ),
                            ),
                            decoration: const InputDecoration(
                              hintText: kAddCategoryTextFieldHintText,
                            ),
                          ),
                        ),
                        IconButton(
                          //TODO Open drawer
                          //Open drawer menu
                          onPressed: () => {},
                          icon: const Icon(Icons.menu),
                        )
                      ],
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
                              if (notification is ScrollEndNotification &&
                                  _scrollController.position.extentAfter == 0) {
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
                  //const SizedBox(height: 60),
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddIdeaPage(),
                      ),
                    ),
                    child: const Icon(Icons.add, size: 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
