part of 'subcategories_bloc.dart';

sealed class SubcategoriesEvent extends Equatable {
  const SubcategoriesEvent();

  @override
  List<Object> get props => [];
}

class SubcategoriesRequested extends SubcategoriesEvent {
  const SubcategoriesRequested();
}

final class SubcategoriesSearchUpdated extends SubcategoriesEvent {
  final String search;

  const SubcategoriesSearchUpdated(this.search);

  @override
  List<Object> get props => [search];
}

final class SubcategoriesFilterRequested extends SubcategoriesEvent {
  final String filter;

  const SubcategoriesFilterRequested(this.filter);

  @override
  List<Object> get props => [filter];
}