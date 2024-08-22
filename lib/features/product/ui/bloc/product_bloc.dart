import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/features/product/product.dart';
import 'package:rxdart/rxdart.dart';

part 'product_event.dart';
part 'product_state.dart';

EventTransformer<Event> debounceSequential<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).asyncExpand(mapper);
}

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    this.category,
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductsState.initial()) {
    on<ProductsRequested>(_onProductsRequested);
    on<ProductsRefreshRequested>(_onProductsRefreshRequested);
    on<ProductsSearchUpdated>(
      _onSearchUpdated,
      transformer: debounceSequential(const Duration(milliseconds: 500)),
    );
  }

  final ProductRepository _productRepository;
  final CategoryItem? category;

  bool _isFetching = false;

  FutureOr<void> _onProductsRequested(
    ProductsRequested event,
    Emitter<ProductsState> emit,
  ) async {
    if (_isFetching || !state.hasMoreContent) return;

    _isFetching = true;

    try {
      emit(state.copyWith(status: ProductsStatus.loading));

      final response = await _productRepository.getProducts(
          // GetQueryParameters(
          //   search: state.search,
          //   categoryId: category?.id,
          //   page: state.page + 1,
          // ),
          );

      final content = response ?? const [];

      emit(state.copyWith(
        status: ProductsStatus.populated,
        products: {...state.products, ...content}.toList(),
        page: state.page + 1,
        hasMoreContent: content.isNotEmpty,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: ProductsStatus.failure));
      addError(error, stackTrace);
    } finally {
      _isFetching = false;
    }
  }

  FutureOr<void> _onProductsRefreshRequested(
    ProductsRefreshRequested event,
    Emitter<ProductsState> emit,
  ) {
    emit(const ProductsState.initial());
    add(ProductsRequested());
  }

  FutureOr<void> _onSearchUpdated(
    ProductsSearchUpdated event,
    Emitter<ProductsState> emit,
  ) {
    emit(const ProductsState.initial().copyWith(
      search: event.search,
    ));
    add(ProductsRequested());
  }
}
