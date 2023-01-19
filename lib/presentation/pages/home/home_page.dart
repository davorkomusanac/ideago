import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../colors.dart';
import '../../../application/ideas/idea_tab_view_helper/idea_tab_view_helper_cubit.dart';
import '../../../application/ideas/ideas_cubit.dart';
import '../../../constants.dart';
import '../../../functions.dart';
import '../../widgets/idea_text_field.dart';
import '../add_idea/add_idea_page.dart';
import 'tab_views/discarded_tab_view.dart';
import 'tab_views/done_tab_view.dart';
import 'tab_views/in_progress_tab_view.dart';
import 'tab_views/todo_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late ScrollController _inProgressTabScrollController;
  late ScrollController _toDoTabScrollController;
  late ScrollController _doneTabScrollController;
  late ScrollController _discardedTabScrollController;
  late TextEditingController _searchIdeasController;
  late Debouncer _debouncer;
  late TabController _tabController;
  final List<Tab> _tabs = <Tab>[
    const Tab(text: kIdeaStatusInProgress),
    const Tab(text: kIdeaStatusToDo),
    const Tab(text: kIdeaStatusDone),
    const Tab(text: kIdeaStatusDiscarded),
  ];

  @override
  void initState() {
    super.initState();
    _inProgressTabScrollController = ScrollController();
    _toDoTabScrollController = ScrollController();
    _doneTabScrollController = ScrollController();
    _discardedTabScrollController = ScrollController();
    _debouncer = Debouncer(milliseconds: 500);
    _tabController = TabController(
      //TODO Check here with local storage, when user creates his first idea, change starting tab to in Progress
      initialIndex: 0,
      length: _tabs.length,
      vsync: this,
    );
    _searchIdeasController = TextEditingController();
  }

  @override
  void dispose() {
    _inProgressTabScrollController.dispose();
    _toDoTabScrollController.dispose();
    _doneTabScrollController.dispose();
    _discardedTabScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          //title: const Text('IdeaGo'),
          actions: [
            IconButton(
              onPressed: () {
                //TODO Open Hamburger menu here
                //Put Red Badge on menu if user is not logged in (as a CTA basically)
                //Options to add here:
                //Login with firebase, privacy and terms of use pages
                //Rate app?
                //Give feedback
                //Settings?
                //Show logo of app
              },
              icon: const Icon(Icons.menu),
            ),
            Expanded(
              child: Center(
                //Theme needed as parent widget to pass color to suffixIcons
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.dark(
                      primary: AppColors.white,
                    ),
                  ),
                  child: IdeaTextField(
                    controller: _searchIdeasController,
                    focusedBorderColor: AppColors.white,
                    filled: true,
                    fillColor: AppColors.primaryBackgroundColor,
                    style: const TextStyle(fontSize: 14),
                    onChanged: (val) {
                      //Calling this setState so that the _searchController gets updated and delete search button appears
                      setState(() {});
                      _debouncer.run(
                        () {
                          context.read<InProgressIdeasCubit>().ideaSearched(
                                val.trim(),
                              );
                          context.read<ToDoIdeasCubit>().ideaSearched(
                                val.trim(),
                              );
                          context.read<DoneIdeasCubit>().ideaSearched(
                                val.trim(),
                              );
                          context.read<DiscardedIdeasCubit>().ideaSearched(
                                val.trim(),
                              );
                        },
                      );
                    },
                    hintText: kIdeaTextFieldSearchHint,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    contentPadding: const EdgeInsets.all(16.0),
                    cursorColor: AppColors.white,
                    suffixIcon: _searchIdeasController.text.isEmpty
                        ? const Icon(
                            Icons.search,
                            size: 20,
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                _searchIdeasController.clear();
                              });
                              context.read<InProgressIdeasCubit>().ideaSearched();
                              context.read<ToDoIdeasCubit>().ideaSearched();
                              context.read<DoneIdeasCubit>().ideaSearched();
                              context.read<DiscardedIdeasCubit>().ideaSearched();
                            },
                            icon: const Icon(
                              Icons.clear,
                              size: 20,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            BlocBuilder<IdeaTabViewHelperCubit, IdeaTabViewHelperState>(
              builder: (context, state) => IconButton(
                onPressed: () => context.read<IdeaTabViewHelperCubit>().changeIdeaTabLayoutPressed(),
                icon: Icon(
                  state.isListViewSelected ? Icons.grid_view : Icons.view_agenda_outlined,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: _tabs,
              indicatorColor: AppColors.primaryForegroundColor,
              labelPadding: EdgeInsets.zero,
            ),
            Expanded(
              child: Stack(
                children: [
                  TabBarView(
                    controller: _tabController,
                    children: [
                      InProgressTabView(
                        scrollController: _inProgressTabScrollController,
                      ),
                      ToDoTabView(
                        scrollController: _toDoTabScrollController,
                      ),
                      DoneTabView(
                        scrollController: _doneTabScrollController,
                      ),
                      DiscardedTabView(
                        scrollController: _discardedTabScrollController,
                      ),
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
                          backgroundColor: AppColors.secondaryForegroundColor,
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
          ],
        ),
      );
}
