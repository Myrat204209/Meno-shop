import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/products/products.dart';
import 'package:rxdart/rxdart.dart';

part 'products_event.dart';
part 'products_state.dart';

EventTransformer<Event> debounceSequential<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).asyncExpand(mapper);
}

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductsState.initial()) {
    on<ProductsRequested>(_onProductsRequested);
    on<ProductsRefreshRequested>(_onProductsRefreshRequested);
    on<ProductsSearchUpdated>(
      _onSearchUpdated,
      transformer: debounceSequential(const Duration(milliseconds: 1000)),
    );
  }

  final ProductRepository _productRepository;
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
        GetProductQueryParameters(
          search: state.search,
          offset: state.offset,
          limit: 10,
          relationFilterSubcategory: event.subcategoryId,
        ),
      );

      final content = response ?? const [];

      emit(state.copyWith(
        status: ProductsStatus.populated,
        products: {...state.products, ...content}.toList(),
        offset: state.offset + 10,
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
    emit(state.copyWith(status: ProductsStatus.initial));
    emit(const ProductsState.initial());
    add(const ProductsRequested());
  }

  FutureOr<void> _onSearchUpdated(
    ProductsSearchUpdated event,
    Emitter<ProductsState> emit,
  ) {
    emit(const ProductsState.initial().copyWith(
      search: event.search,
    ));
    add(const ProductsRequested());
  }
}
