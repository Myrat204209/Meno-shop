// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'subcategories_bloc.dart';

enum SubcategoriesStatus {
  initial,
  loading,
  populated,
  failure,
}

final class SubcategoriesState extends Equatable {
  const SubcategoriesState({
    required this.status,
    this.subcategories = const [],
  });

  const SubcategoriesState.initial()
      : this(status: SubcategoriesStatus.initial);

  final SubcategoriesStatus status;
  final List<SubcategoryItem> subcategories;

  @override
  List<Object> get props => [
        status,
        subcategories,
      ];

  SubcategoriesState copyWith({
    SubcategoriesStatus? status,
    List<SubcategoryItem>? subcategories,
  }) {
    return SubcategoriesState(
      status: status ?? this.status,
      subcategories: subcategories ?? this.subcategories,
    );
  }
}
