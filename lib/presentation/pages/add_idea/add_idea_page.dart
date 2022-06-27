import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../application/add_or_update_idea/add_or_update_idea_cubit.dart';
import '../../../application/rate_idea/rate_idea_cubit.dart';
import '../../../constants.dart';
import '../../../functions.dart';
import '../../../idea_rating_questions.dart';
import '../../widgets/idea_status_bottom_sheet.dart';
import '../../widgets/idea_textfield.dart';
import '../../widgets/idea_textfield_label.dart';
import '../rate_idea/rate_idea_page.dart';

class AddIdeaPage extends StatefulWidget {
  const AddIdeaPage({Key? key}) : super(key: key);

  @override
  State<AddIdeaPage> createState() => _AddIdeaPageState();
}

class _AddIdeaPageState extends State<AddIdeaPage> with TickerProviderStateMixin {
  late TextEditingController _titleController;
  late TextEditingController _summaryController;
  late TextEditingController _fullDescriptionController;
  late TextEditingController _statusController;
  late TextEditingController _ratingController;
  late TextEditingController _categoriesController;
  late TabController _tabController;
  final List<Tab> _tabs = <Tab>[
    const Tab(text: ideaTabTitleOne),
    const Tab(text: ideaTabTitleTwo),
  ];
  final FocusNode _descriptionFullScreenFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _summaryController = TextEditingController();
    _fullDescriptionController = TextEditingController();
    _statusController = TextEditingController(text: ideaStatusToDo);
    _ratingController = TextEditingController(text: ideaTextFieldRatingInitialValue);
    _categoriesController = TextEditingController();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _summaryController.dispose();
    _fullDescriptionController.dispose();
    _statusController.dispose();
    _ratingController.dispose();
    _categoriesController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  //TODO Extract this into separate file
  List<Widget> getTabViews(BuildContext context) => <Widget>[
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const IdeaTextFieldLabel(
                label: ideaTextFieldTitleLabel,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IdeaTextField(
                        controller: _titleController,
                        hintText: ideaTextFieldTitleHint,
                        //TODO Turn on later
                        autofocus: false,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    onPressed: () {
                      //TODO WIll pop scope, show alert dialog for unsaved changes
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 24),
              const IdeaTextFieldLabel(
                label: ideaTextFieldSummaryLabel,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: IdeaTextField(
                  controller: _summaryController,
                  hintText: ideaTextFieldSummaryHint,
                ),
              ),
              const SizedBox(height: 24),
              const IdeaTextFieldLabel(
                label: ideaTextFieldFullDescriptionLabel,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Stack(
                  children: [
                    IdeaTextField(
                      controller: _fullDescriptionController,
                      hintText: ideaTextFieldFullDescriptionHint,
                      minLines: 10,
                      maxLines: 10,
                      contentPadding: const EdgeInsets.fromLTRB(12, 12, 20, 12),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: () {
                          _descriptionFullScreenFocusNode.requestFocus();
                          context.read<AddOrUpdateIdeaCubit>().descriptionButtonPressed();
                        },
                        icon: const Icon(Icons.fullscreen),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    BlocListener<AddOrUpdateIdeaCubit, AddOrUpdateIdeaState>(
                      listener: (context, state) {
                        if (state.ideaProjectStatus != _statusController.text) {
                          _statusController.text = state.ideaProjectStatus;
                        }
                      },
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const IdeaTextFieldLabel(
                              label: ideaTextFieldStatus,
                              leftPadding: 12.0,
                            ),
                            IdeaTextField(
                              controller: _statusController,
                              readOnly: true,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                              ),
                              onTap: () {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => IdeaStatusBottomSheet(
                                    cubit: BlocProvider.of<AddOrUpdateIdeaCubit>(context),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 26),
                    //TODO Make it a button which takes to review your idea screen
                    BlocListener<RateIdeaCubit, RateIdeaState>(
                      listener: (context, state) {
                        _ratingController.text = formatIdeaRatingResult(state.ratingsSum);
                      },
                      child: Expanded(
                        child: Column(
                          children: [
                            const IdeaTextFieldLabel(
                              label: ideaTextFieldRatingTitle,
                              leftPadding: 12.0,
                            ),
                            IdeaTextField(
                              controller: _ratingController,
                              readOnly: true,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => RateIdeaPage(
                                      cubit: BlocProvider.of<RateIdeaCubit>(context),
                                    ),
                                  ),
                                );
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const IdeaTextFieldLabel(
                label: ideaTextFieldCategories,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //TODO Implement Categories with a horizontal scroll?
                child: IdeaTextField(
                  controller: _categoriesController,
                  maxLines: null,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                child: Column(
                  children: [],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  //TODO Create Idea
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        //TODO Implement Features design
        const Center(
          child: Text('Features Screen - To Be Implemented'),
        ),
      ];

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AddOrUpdateIdeaCubit>(
            create: (context) => AddOrUpdateIdeaCubit(),
          ),
          BlocProvider<RateIdeaCubit>(
            create: (context) => RateIdeaCubit()
              ..ratingsLoaded(
                questionRatings: initialIdeaRatingQuestions,
                ratingsSum: 50,
              ),
          ),
        ],
        child: GestureDetector(
          //Dismiss keyboard when user taps somewhere outside a TextField
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            //TODO Change design
            backgroundColor: Colors.blue[900],
            body: SafeArea(
              child: BlocBuilder<AddOrUpdateIdeaCubit, AddOrUpdateIdeaState>(
                builder: (context, state) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.fastOutSlowIn,
                  //Default animation is FadeTransition, changed type to Scale for smoother feel
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    alignment: Alignment.bottomRight,
                    child: child,
                  ),
                  child: state.isDescriptionExpanded
                      ? CustomScrollView(
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          slivers: [
                            //A scrollview is needed to be able to dismiss keyboard on drag, CustomScrollView works with Expanded
                            SliverFillRemaining(
                              child: Column(
                                //A key is needed here so that AnimatedSwitcher can know the difference between children and animate them
                                key: const ValueKey<int>(0),
                                children: [
                                  const IdeaTextFieldLabel(
                                    label: ideaTextFieldFullDescriptionLabel,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0,
                                        bottom: 16.0,
                                      ),
                                      child: Stack(
                                        children: [
                                          IdeaTextField(
                                            focusNode: _descriptionFullScreenFocusNode,
                                            controller: _fullDescriptionController,
                                            hintText: ideaTextFieldFullDescriptionHint,
                                            minLines: null,
                                            maxLines: null,
                                            expands: true,
                                            contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 36),
                                          ),
                                          Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: InkWell(
                                              onTap: () =>
                                                  context.read<AddOrUpdateIdeaCubit>().descriptionButtonPressed(),
                                              child: const Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Icon(Icons.fullscreen_exit),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          key: const ValueKey<int>(1),
                          children: [
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: getTabViews(context),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TabBar(
                              tabs: _tabs,
                              controller: _tabController,
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      );
}
