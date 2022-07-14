import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/idea_category/idea_category.dart';
import '../../functions.dart';
import '../../repository/idea_category/idea_category_repository.dart';

part 'idea_categories_state.dart';

class IdeaCategoriesCubit extends Cubit<IdeaCategoriesState> {
  IdeaCategoriesCubit(this._repository) : super(const IdeaCategoriesState());

  final IdeaCategoryRepository _repository;

  void checkedCategoriesInitialized(List<String> currentIdeaCheckedCategories) {
    emit(
      state.copyWith(
        checkedCategories: currentIdeaCheckedCategories,
      ),
    );
  }

  ///Load all categories both in categories and allLoadedCategories, so that when the user is
  ///searching for some category and wants to filter, we don't need to re-read the categories from storage
  Future<void> allCategoriesLoaded() async {
    emit(
      state.copyWith(
        status: IdeaCategoriesStatus.loading,
        isSearchedCategoryAlreadyCreated: true,
      ),
    );

    try {
      final categories = await _repository.getAllIdeaCategories();

      ///This is a workaround for handling which categories are added to current idea
      ///Check for categories inside current idea and make them checked
      final updatedCategories = categories.map((e) {
        if (state.checkedCategories.contains(e.title)) {
          return e.copyWith(isChecked: true);
        } else {
          return e;
        }
      }).toList();

      sortCategories(updatedCategories);

      emit(
        state.copyWith(
          allLoadedCategories: updatedCategories,
          categories: updatedCategories,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: IdeaCategoriesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  ///Add app wide category to categories collection
  Future<void> categoryAdded(String categoryTitle) async {
    try {
      final category = IdeaCategory(
        uid: const Uuid().v4(),
        title: categoryTitle,
      );
      await _repository.addIdeaCategory(category);
      final updatedCategories = [...state.categories, category];
      final updatedAllCategories = [...state.allLoadedCategories, category];

      emit(
        state.copyWith(
          categories: updatedCategories,
          allLoadedCategories: updatedAllCategories,
          status: IdeaCategoriesStatus.success,
          isSearchedCategoryAlreadyCreated: true,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: IdeaCategoriesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  ///Remove app wide category from categories collection
  Future<void> categoryDeleted(IdeaCategory category) async {
    try {
      await _repository.deleteIdeaCategory(category);
      final updatedCategories = [...state.categories];
      updatedCategories.remove(category);
      final currentIdeaCheckedCategories = [...state.checkedCategories];
      currentIdeaCheckedCategories.remove(category.title);

      emit(
        state.copyWith(
          categories: updatedCategories,
          checkedCategories: currentIdeaCheckedCategories,
          status: IdeaCategoriesStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: IdeaCategoriesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  ///Category from collection is checked and needs to be added to the current Idea
  void categoryChecked(IdeaCategory category) {
    final currentIdeaCheckedCategories = [...state.checkedCategories];

    if (!currentIdeaCheckedCategories.contains(category.title)) {
      currentIdeaCheckedCategories.add(category.title);
      //Go through current categories and update the one that was checked
      final updatedCategories = state.categories
          .map(
            (e) => e.title == category.title ? e.copyWith(isChecked: true) : e,
          )
          .toList();
      emit(
        state.copyWith(
          checkedCategories: currentIdeaCheckedCategories,
          categories: updatedCategories,
        ),
      );
    }
  }

  void categoryUnchecked(IdeaCategory category) {
    final currentIdeaCheckedCategories = [...state.checkedCategories];

    //Remove the unchecked category and update the widget
    if (currentIdeaCheckedCategories.remove(category.title)) {
      final updatedCategories = state.categories
          .map(
            (e) => e.title == category.title ? e.copyWith(isChecked: false) : e,
          )
          .toList();
      emit(
        state.copyWith(
          checkedCategories: currentIdeaCheckedCategories,
          categories: updatedCategories,
        ),
      );
    }
  }

  void categorySearched(String searchTerm) {
    ///Have to iterate through the whole categories collection and iterate through checked categories
    ///to update the list if a user checks a category while searching and then changes search parameters
    ///Currently not an ideal solution since theoretically this method could end up doing a lot of computing,
    final updatedCategories = state.allLoadedCategories
        .map(
          (e) => state.checkedCategories.contains(e.title) ? e.copyWith(isChecked: true) : e,
        )
        .toList();

    if (searchTerm.trim().isEmpty) {
      sortCategories(updatedCategories);
      emit(
        state.copyWith(
          categories: updatedCategories,
          isSearchedCategoryAlreadyCreated: true,
          searchTerm: '',
        ),
      );
    } else {
      bool isSearchedCategoryAlreadyCreated = false;
      updatedCategories.retainWhere(
        (category) {
          ///Need to check if the searched category already exists, since we will allow
          ///the user to create the new category if it's exact match does not exist
          ///doing it inside retainWhere since it already iterates through updatedCategories
          if (category.title.toLowerCase() == searchTerm.trim().toLowerCase()) {
            isSearchedCategoryAlreadyCreated = true;
          }
          return category.title.toLowerCase().contains(
                searchTerm.trim().toLowerCase(),
              );
        },
      );

      emit(
        state.copyWith(
          categories: updatedCategories,
          isSearchedCategoryAlreadyCreated: isSearchedCategoryAlreadyCreated,
          searchTerm: searchTerm.trim(),
        ),
      );
    }
  }

  void ideaCategoryRemoved(String category) {
    final currentIdeaCheckedCategories = [...state.checkedCategories];
    currentIdeaCheckedCategories.remove(category);

    emit(
      state.copyWith(
        checkedCategories: currentIdeaCheckedCategories,
      ),
    );
  }
}
