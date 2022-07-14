import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'application/ideas/ideas_cubit.dart';
import 'data/databases/idea/ideas_offline_db.dart';
import 'data/databases/idea_category/idea_category_offline_db.dart';
import 'data/models/idea/isar_idea/isar_idea.dart';
import 'data/models/idea_category/isar_idea_category/isar_idea_category.dart';
import 'presentation/pages/home/home_page.dart';
import 'repository/idea/idea_repository.dart';
import 'repository/idea_category/idea_category_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final dir = await getApplicationSupportDirectory();
  await Isar.open(
    schemas: [
      IsarIdeaSchema,
      IsarIdeaCategorySchema,
    ],
    directory: dir.path,
    inspector: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IdeaRepository>(
            create: (_) => IdeaRepository(
              offlineDb: IdeaOfflineDb(),
            ),
          ),
          RepositoryProvider<IdeaCategoryRepository>(
            create: (context) => IdeaCategoryRepository(
              offlineDb: IdeaCategoryOfflineDb(),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => IdeasCubit(
                context.read<IdeaRepository>(),
              )..allIdeasLoaded(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IdeaGo',
            theme: ThemeData(
              //TODO change theme data colors
              primarySwatch: Colors.blue,
              backgroundColor: Colors.cyan,
              primaryColor: Colors.green,
            ),
            home: const HomePage(),
          ),
        ),
      );
}
