import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ideas/ideas_cubit.dart';
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
              child: BlocBuilder<IdeasCubit, IdeasState>(
                builder: (context, state) {
                  if (state.status == IdeasStatus.initial) {
                    return const Center(
                      child: Text("Add ideas to show them"),
                    );
                  } else if (state.status == IdeasStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == IdeasStatus.error) {
                    return const Center(
                      child: Text("There was an error loading ideas"),
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
                  onPressed: () {},
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
