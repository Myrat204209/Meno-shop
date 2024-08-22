import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart' show SubcategoryItem;
import 'package:equatable/equatable.dart';
import 'package:meno_shop/features/subcategories/subcategories.dart';

part 'subcategories_event.dart';
part 'subcategories_state.dart';

class SubcategoriesBloc extends Bloc<SubcategoriesEvent, SubcategoriesState> {
  SubcategoriesBloc({
    required SubcategoryRepository subcategoryRepository,
  })  : _subcategoryRepository = subcategoryRepository,
        super(const SubcategoriesState.initial()) {
    on<SubcategoriesRequested>(_onSubcategoriesRequested);
  }

  final SubcategoryRepository _subcategoryRepository;

  FutureOr<void> _onSubcategoriesRequested(
    SubcategoriesRequested event,
    Emitter<SubcategoriesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SubcategoriesStatus.loading));
      final response = await _subcategoryRepository.getSubcategories();
      emit(state.copyWith(
        status: SubcategoriesStatus.populated,
        subcategories: response,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: SubcategoriesStatus.failure));
      addError(error, stackTrace);
    }
  }
}
