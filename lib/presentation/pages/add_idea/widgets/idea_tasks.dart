import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../application/idea_tasks/idea_tasks_cubit.dart';
import '../../../../colors.dart';
import '../../../../constants.dart';
import '../tasks/add_task_bottom_sheet.dart';
import '../tasks/task_list_tile.dart';

class IdeaTasks extends StatelessWidget {
  const IdeaTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<IdeaTasksCubit, IdeaTasksState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppColors.grey,
                    width: 1.5,
                  ),
                ),
                height: 200,
                child: state.tasks.isEmpty
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 12,
                              top: 12,
                            ),
                            child: Text(
                              kIdeaTextFieldTasksHint,
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
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
              Positioned(
                right: 10,
                bottom: 10,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: AppColors.secondaryForegroundColor,
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      //Same as inside Reorderable ListView, just needs a text field for entering new tasks
                      showMaterialModalBottomSheet(
                        context: context,
                        enableDrag: false,
                        backgroundColor: AppColors.transparentColor,
                        builder: (_) => BlocProvider<IdeaTasksCubit>.value(
                          value: BlocProvider.of<IdeaTasksCubit>(context),
                          child: const AddTaskBottomSheet(),
                        ),
                      );
                    },
                    child: const Icon(Icons.add, size: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
