import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ideas/ideas_cubit.dart';
import '../../widgets/themed_circular_progress_indicator.dart';
import '../home/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<InProgressIdeasCubit, IdeasState>(
        listener: (context, state) {
          if (state.status != IdeasStatus.loading) {
            if (state.status == IdeasStatus.error && state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        child: const Scaffold(
          body: SafeArea(
            child: Center(
              child: ThemedCircularProgressIndicator(),
            ),
          ),
        ),
      );
}
