part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class CategoriesRequested extends CategoriesEvent {
  const CategoriesRequested();
}

final class CategoriesSearchUpdated extends CategoriesEvent {
  final String search;

  const CategoriesSearchUpdated(this.search);

  @override
  List<Object> get props => [search];
}

final class CategoriesFilterRequested extends CategoriesEvent {
  final String filter;

  const CategoriesFilterRequested(this.filter);

  @override
  List<Object> get props => [filter];
}