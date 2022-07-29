import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ideas/ideas_cubit.dart';
import '../../../constants.dart';
import '../../widgets/idea_card.dart';
import '../add_idea/add_idea_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            //Row with
            //TextField
            //Filter button
            //
            const Center(
              child: Text('Title'),
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Center(
                        child: Text(
                          state.errorMessageLoadingIdeas,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (state.status == IdeasStatus.success && state.ideas.isEmpty) {
                    return const Center(
                      child: Text("Add ideas to show them"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: state.ideas.length,
                      itemBuilder: (context, index) {
                        var idea = state.ideas[index];
                        return IdeaCard(
                          idea: idea,
                          key: ValueKey(
                            idea.uid,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<IdeasCubit>().fetchIdeasNextPage(
                          context.read<IdeasCubit>().state.ideas.length,
                        );
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Update'),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      );
}
