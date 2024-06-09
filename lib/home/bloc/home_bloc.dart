import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/categories/categories.dart';
// import 'package:meno_shop/product/product.dart' show ProductRepository;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required CategoryRepository categoryRepository,
    // required ProductRepository productRepository,
  })  : _categoryRepository = categoryRepository,
        // _productRepository = productRepository,
        super(const HomeState.initial()) {
    on<HomeRequested>(_onHomeRequested);
  }
  final CategoryRepository _categoryRepository;
  // final ProductRepository _productRepository;
  FutureOr<void> _onHomeRequested(
    HomeRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final response = await _categoryRepository.getCategories(
        GetQueryParameters(
          populate: [
            'photo',
          ],
        ),
      );

      emit(state.copyWith(
        status: HomeStatus.populated,
        categories: response,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: HomeStatus.failure));
      addError(error, stackTrace);
    }
  }
}
