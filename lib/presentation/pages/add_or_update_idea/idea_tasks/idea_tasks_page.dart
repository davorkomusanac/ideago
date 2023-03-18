import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/idea_tasks/idea_tasks_cubit.dart';
import '../../../../colors.dart';
import '../../../../constants.dart';
import '../../../widgets/idea_text_field.dart';
import 'task_list_tile.dart';

class IdeaTasksPage extends StatefulWidget {
  const IdeaTasksPage({Key? key}) : super(key: key);

  @override
  State<IdeaTasksPage> createState() => _IdeaTasksPageState();
}

class _IdeaTasksPageState extends State<IdeaTasksPage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              const SizedBox(
                width: 8,
              ),
              const BackButton(),
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
                      controller: _textEditingController,
                      autofocus: true,
                      hintText: kAddIdeaTaskTextFieldHintText,
                      focusedBorderColor: AppColors.white,
                      filled: true,
                      fillColor: AppColors.primaryBackgroundColor,
                      cursorColor: AppColors.white,
                      onChanged: (val) {
                        //Calling this setState so that the _searchController gets updated and delete search button appears
                        setState(() {});
                      },
                      //onEditing is set to an empty function to stop dismissing the keyboard
                      onEditingComplete: () {},
                      onSubmitted: (val) {
                        if (_textEditingController.text.isNotEmpty) {
                          context.read<IdeaTasksCubit>().taskCreated(val);
                          setState(() {
                            _textEditingController.clear();
                          });
                        }
                      },
                      suffixIcon: _textEditingController.text.isEmpty
                          ? const Icon(
                              Icons.add,
                              size: 24,
                              //This icon is transparent because its purpose is only to align the text field vertically
                              color: AppColors.transparentColor,
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  _textEditingController.clear();
                                });
                              },
                              icon: const Icon(
                                Icons.clear,
                                size: 24,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: _textEditingController.text.isEmpty
                    ? null
                    : () {
                        context.read<IdeaTasksCubit>().taskCreated(_textEditingController.text);
                        setState(
                          () {
                            _textEditingController.clear();
                          },
                        );
                      },
                icon: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _textEditingController.text.isEmpty ? AppColors.grey : AppColors.white,
                    ),
                    color: _textEditingController.text.isEmpty
                        ? AppColors.primaryBackgroundColor
                        : AppColors.primaryBackgroundColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: BlocBuilder<IdeaTasksCubit, IdeaTasksState>(
            builder: (context, state) => Column(
              children: [
                Expanded(
                  child: state.tasks.isEmpty
                      ? const Center(
                          child: Text(kAddIdeaTasksEmptyTasks),
                        )
                      : ReorderableListView.builder(
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          buildDefaultDragHandles: false,
                          onReorder: (oldIndex, newIndex) => context.read<IdeaTasksCubit>().taskReordered(
                                oldIndex: oldIndex,
                                newIndex: newIndex,
                              ),
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) => TaskListTile(
                            key: Key(state.tasks[index].uid),
                            task: state.tasks[index],
                            index: index,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
}
