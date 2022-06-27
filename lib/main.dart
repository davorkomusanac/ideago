import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'application/ideas/ideas_cubit.dart';
import 'data/databases/ideas_offline_db.dart';
import 'data/models/idea/idea.dart';
import 'presentation/pages/home/home_page.dart';
import 'repository/ideas_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final dir = await getApplicationSupportDirectory();
  await Isar.open(
    schemas: [IdeaSchema],
    directory: dir.path,
    inspector: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => RepositoryProvider<IdeasRepository>(
        create: (_) => IdeasRepository(
          offlineDb: IdeasOfflineDB(),
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => IdeasCubit(
                context.read<IdeasRepository>(),
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
