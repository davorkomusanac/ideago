import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/idea_categories/idea_categories_cubit.dart';
import '../../../constants.dart';
import 'widgets/add_category_list_tile.dart';
import 'widgets/category_list_tile.dart';

class AddIdeaCategoryBottomSheet extends StatefulWidget {
  const AddIdeaCategoryBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddIdeaCategoryBottomSheet> createState() => _AddIdeaCategoryBottomSheetState();
}

class _AddIdeaCategoryBottomSheetState extends State<AddIdeaCategoryBottomSheet> {
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
        duration: const Duration(milliseconds: 250),
        child: GestureDetector(
          //Dismiss keyboard when user taps somewhere outside a TextField
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              //TODO Apply colors
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: BlocBuilder<IdeaCategoriesCubit, IdeaCategoriesState>(
              builder: (context, state) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      top: 24.0,
                      bottom: 12.0,
                      right: 16.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            onChanged: (val) => context.read<IdeaCategoriesCubit>().categorySearched(val),
                            decoration: const InputDecoration(
                              hintText: kAddCategoryTextFieldHintText,
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
                  state.status == IdeaCategoriesStatus.loading
                      ? const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : state.status == IdeaCategoriesStatus.error
                          ? Expanded(
                              child: Center(
                                child: Text(state.errorMessage),
                              ),
                            )
                          : Expanded(
                              child: state.categories.isEmpty && _textEditingController.text.isEmpty
                                  ? const Center(
                                      child: Text(kAddCategoryTextEmptyCategories),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.all(0.0),
                                      itemCount: state.isSearchedCategoryAlreadyCreated
                                          ? state.categories.length
                                          : state.categories.length + 1,
                                      itemBuilder: (context, index) {
                                        if (state.isSearchedCategoryAlreadyCreated) {
                                          return CategoryListTile(
                                            category: state.categories[index],
                                          );
                                        } else {
                                          return index == 0
                                              ? AddCategoryListTile(
                                                  title: state.searchTerm,
                                                )
                                              : CategoryListTile(
                                                  category: state.categories[index - 1],
                                                );
                                        }
                                      },
                                    ),
                            ),
                ],
              ),
            ),
          ),
        ),
      );
}
