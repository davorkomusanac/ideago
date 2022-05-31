import 'package:flutter/material.dart';
import 'package:ideago/constants.dart';
import 'package:ideago/presentation/widgets/idea_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IdeaGo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Row with
          //TextField
          //Filter button
          //
          Center(
            child: Text('Title'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tempIdeas.length,
              itemBuilder: (context, index) => IdeaCard(
                idea: tempIdeas[index],
                key: ValueKey(
                  tempIdeas[index].uid,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
