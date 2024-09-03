import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart'
    show CategoryItem, GetCategoryQueryParameters;
import 'package:equatable/equatable.dart';
import 'package:meno_shop/categories/categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({
    required CategoryRepository categoryRepository,
  })  : _categoryRepository = categoryRepository,
        super(const CategoriesState.initial()) {
    on<CategoriesRequested>(_onCategoriesRequested);
  }

  final CategoryRepository _categoryRepository;

  FutureOr<void> _onCategoriesRequested(
    CategoriesRequested event,
    Emitter<CategoriesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CategoriesStatus.loading));
      final response = await _categoryRepository.getCategories(
        GetCategoryQueryParameters(
          offset: 0,
          limit: 30,
          populate: ['subcategories'],
        ),
      );
      emit(state.copyWith(
        status: CategoriesStatus.populated,
        categories: response,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CategoriesStatus.failure));
      addError(error, stackTrace);
    }
  }
}
