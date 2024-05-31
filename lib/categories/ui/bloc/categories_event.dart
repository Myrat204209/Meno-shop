part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class CategoriesRequested extends CategoriesEvent {
  const CategoriesRequested();

  @override
  List<Object> get props => [];
}

class CategorySelected extends CategoriesEvent {
  const CategorySelected({required this.category});
  //
  final Category category;

  @override
  List<Object> get props => [category];
}
