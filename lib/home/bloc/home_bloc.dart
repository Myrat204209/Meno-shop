import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/categories/categories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required CategoryRepository categoryRepository,
  })  : _categoryRepository = categoryRepository,
        super(const HomeState.initial()) {
    on<HomeRequested>(_onHomeRequested);
  }
  final CategoryRepository _categoryRepository;

  FutureOr<void> _onHomeRequested(
    HomeRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final response = await _categoryRepository.getCategories();

      emit(state.copyWith(
        status: HomeStatus.populated,
        categories: response.data,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: HomeStatus.failure));
      addError(error, stackTrace);
    }
  }
}
