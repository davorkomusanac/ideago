import 'package:flutter/material.dart';
import 'package:ideago/presentation/widgets/idea_textfield.dart';

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
    const Tab(
      text: 'Idea',
    ),
    const Tab(
      text: 'Features',
    ),
  ];
  final FocusNode _descriptionFullScreenFocusNode = FocusNode();
  bool isDescriptionFullScreen = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _summaryController = TextEditingController();
    _fullDescriptionController = TextEditingController();
    _statusController = TextEditingController();
    _ratingController = TextEditingController();
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
  List<Widget> getTabViews() {
    return <Widget>[
      SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IdeaTextField(
                      labelText: 'Title',
                      controller: _titleController,
                      autofocus: true,
                      hintText: 'Type the name of your idea..',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IdeaTextField(
                labelText: 'Summary',
                controller: _summaryController,
                hintText: 'Add short summary of your idea..',
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  IdeaTextField(
                    labelText: 'Full description',
                    controller: _fullDescriptionController,
                    hintText: 'Add full description regarding your idea..',
                    minLines: 10,
                    maxLines: 10,
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 20, 12),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        //TODO Change state with bloc here
                        setState(() {
                          _descriptionFullScreenFocusNode.requestFocus();
                          isDescriptionFullScreen = !isDescriptionFullScreen;
                        });
                      },
                      icon: const Icon(Icons.fullscreen),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    //TODO Make a dropdown
                    child: IdeaTextField(
                      labelText: 'Status',
                      controller: _statusController,
                    ),
                  ),
                  const SizedBox(width: 26),
                  //TODO Make it a button which takes to review your idea screen
                  Expanded(
                    child: IdeaTextField(
                      labelText: 'Rating',
                      controller: _ratingController,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //TODO Implement Categories with a horizontal scroll?
              child: IdeaTextField(
                labelText: 'Categories',
                controller: _categoriesController,
              ),
            ),
            const SizedBox(height: 26),
            ElevatedButton(
              onPressed: () {
                //TODO Create Idea
              },
              child: Text('Finish'),
            ),
          ],
        ),
      ),
      //TODO Implement Features design
      Center(
        child: Text('Features Screen - To Be Implemented'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //Dismiss keyboard when user taps somewhere outside a TextField
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        //TODO Change design
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.fastOutSlowIn,
            switchOutCurve: Curves.fastOutSlowIn,
            //Default animation is FadeTransition, changed type to Scale for smoother feel
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              alignment: Alignment.bottomRight,
              child: child,
            ),
            child: isDescriptionFullScreen
                ? CustomScrollView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    slivers: [
                      //A scrollview is needed to be able to dismiss keyboard on drag, CustomScrollView works with Expanded
                      SliverFillRemaining(
                        child: Column(
                          //A key is needed here so that AnimatedSwitcher can know the difference between children and animate them
                          key: const ValueKey<int>(0),
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Stack(
                                  children: [
                                    IdeaTextField(
                                      focusNode: _descriptionFullScreenFocusNode,
                                      labelText: 'Full description',
                                      controller: _fullDescriptionController,
                                      hintText: 'Add full description regarding your idea..',
                                      minLines: null,
                                      maxLines: null,
                                      expands: true,
                                      contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 36),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            //TODO Change state with Bloc
                                            isDescriptionFullScreen = !isDescriptionFullScreen;
                                          });
                                        },
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
                          children: getTabViews(),
                        ),
                      ),
                      TabBar(
                        tabs: _tabs,
                        controller: _tabController,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
