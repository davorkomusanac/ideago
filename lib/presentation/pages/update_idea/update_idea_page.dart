import 'package:flutter/material.dart';
import 'package:ideago/presentation/widgets/idea_textfield.dart';

class AddIdeaPage extends StatefulWidget {
  const AddIdeaPage({Key? key}) : super(key: key);

  @override
  State<AddIdeaPage> createState() => _AddIdeaPageState();
}

class _AddIdeaPageState extends State<AddIdeaPage>
    with TickerProviderStateMixin {
  late TextEditingController _titleController;
  late TextEditingController _shortDescriptionController;
  late TextEditingController _longDescriptionController;
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

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _shortDescriptionController = TextEditingController();
    _longDescriptionController = TextEditingController();
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
    _shortDescriptionController.dispose();
    _longDescriptionController.dispose();
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
            Row(
              children: [
                BackButton(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IdeaTextField(
                      labelText: 'Title',
                      controller: _titleController,
                      autofocus: true,
                    ),
                  ),
                ),
                //TODO Show only on update screen?
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                minLines: 1,
                maxLines: 15,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      minLines: 1,
                      maxLines: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      minLines: 1,
                      maxLines: 15,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                minLines: 1,
                maxLines: 15,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Column(
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
    );
  }
}
