import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/idea_tasks/idea_tasks_cubit.dart';
import '../../../../colors.dart';
import '../../../../constants.dart';
import 'task_list_tile.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
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
  Widget build(BuildContext context) => AnimatedPadding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        duration: const Duration(milliseconds: 100),
        child: GestureDetector(
          //Dismiss keyboard when user taps somewhere outside a TextField
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              color: AppColors.primaryBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: BlocBuilder<IdeaTasksCubit, IdeaTasksState>(
              builder: (context, state) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 2.0,
                      top: 24.0,
                      bottom: 4.0,
                      right: 16.0,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _textEditingController.text.isEmpty
                              ? null
                              : () {
                                  context.read<IdeaTasksCubit>().taskCreated(_textEditingController.text);
                                  setState(() {
                                    _textEditingController.clear();
                                  });
                                },
                          icon: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryForegroundColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.add),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            controller: _textEditingController,
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
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: AppColors.primaryForegroundColor,
                            style: const TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              hoverColor: Colors.teal,
                              hintText: kAddIdeaTaskTextFieldHintText,
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primaryForegroundColor),
                              ),
                              suffixIcon: _textEditingController.text.isEmpty
                                  ? const Icon(
                                      Icons.add,
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
                                        //size: 20,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_upward),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: state.tasks.isEmpty
                        ? const Center(
                            child: Text(kAddIdeaTasksEmptyTasks),
                          )
                        : ReorderableListView.builder(
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
        ),
      );
}
