// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'categories_bloc.dart';

enum CategoriesStatus {
  initial,
  loading,
  populated,
  failure,
}

// @JsonSerializable()
class CategoriesState extends Equatable {
  const CategoriesState({
    required this.status,
    this.categories,
    this.selectedCategory,
  });
  const CategoriesState.initial()
      : this(
          status: CategoriesStatus.initial,
        );
  // factory CategoriesState.fromJson(JsonType json) =>
  //     _$CategoriesStateFromJson(json);

  final CategoriesStatus status;
  final List<Category>? categories;
  final Category? selectedCategory;

  @override
  List<Object?> get props => [
        status,
        categories,
        selectedCategory,
      ];

  CategoriesState copyWith({
    CategoriesStatus? status,
    List<Category>? categories,
    Category? selectedCategory,
  }) {
    return CategoriesState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  // JsonType toJson() => _$CategoriesStateToJson(this);
}
