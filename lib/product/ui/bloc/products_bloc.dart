import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/product/product.dart';
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
    on<ProductByUuidRequested>(_onProductByUuidRequested);
    on<ProductsSearchUpdated>(
      _onSearchUpdated,
      transformer: debounceSequential(const Duration(milliseconds: 500)),
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

      final response = await _productRepository.getProducts();

      final content = response ?? const [];

      emit(state.copyWith(
        status: ProductsStatus.populated,
        products: {...state.products, ...content}.toList(),
        hasMoreContent: content.isNotEmpty,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: ProductsStatus.failure));
      addError(error, stackTrace);
    } finally {
      _isFetching = false;
    }
  }

  FutureOr<void> _onProductByUuidRequested(
    ProductByUuidRequested event,
    Emitter<ProductsState> emit,
  ) async {
    if (_isFetching) return;
    _isFetching = true;
    try {
      emit(state.copyWith(status: ProductsStatus.singleProductLoading));

      final response =
          await _productRepository.getProductByUuid(uuid: event.productUuid);

      emit(state.copyWith(
        status: ProductsStatus.singleProductPopulated,
        singleProduct: response,
        hasMoreContent: false,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: ProductsStatus.singleProductFailure));
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
