part of 'idea_categories_cubit.dart';

enum IdeaCategoriesStatus {
  loading,
  success,
  error,
}

class IdeaCategoriesState extends Equatable {
  const IdeaCategoriesState({
    this.status = IdeaCategoriesStatus.loading,
    this.categories = const <IdeaCategory>[],
    this.allLoadedCategories = const <IdeaCategory>[],
    this.checkedCategories = const <String>[],
    this.errorMessage = '',
    this.searchTerm = '',
    this.isSearchedCategoryAlreadyCreated = true,
  });

  final IdeaCategoriesStatus status;
  final List<IdeaCategory> categories;
  final List<IdeaCategory> allLoadedCategories;
  final List<String> checkedCategories;
  final String errorMessage;
  final String searchTerm;
  final bool isSearchedCategoryAlreadyCreated;

  IdeaCategoriesState copyWith({
    IdeaCategoriesStatus? status,
    List<IdeaCategory>? categories,
    List<IdeaCategory>? allLoadedCategories,
    List<String>? checkedCategories,
    String? errorMessage,
    String? searchTerm,
    bool? isSearchedCategoryAlreadyCreated,
  }) =>
      IdeaCategoriesState(
        status: status ?? this.status,
        categories: categories ?? this.categories,
        allLoadedCategories: allLoadedCategories ?? this.allLoadedCategories,
        checkedCategories: checkedCategories ?? this.checkedCategories,
        errorMessage: errorMessage ?? this.errorMessage,
        searchTerm: searchTerm ?? this.searchTerm,
        isSearchedCategoryAlreadyCreated: isSearchedCategoryAlreadyCreated ?? this.isSearchedCategoryAlreadyCreated,
      );

  @override
  List<Object> get props => [
        status,
        categories,
        allLoadedCategories,
        checkedCategories,
        errorMessage,
        searchTerm,
        isSearchedCategoryAlreadyCreated,
      ];
}
