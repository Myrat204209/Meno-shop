part of 'subcategories_bloc.dart';

sealed class SubcategoriesEvent extends Equatable {
  const SubcategoriesEvent();

  @override
  List<Object> get props => [];
}

class SubcategoriesRequested extends SubcategoriesEvent {
  const SubcategoriesRequested();
}
