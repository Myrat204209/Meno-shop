import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/products/products.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(const ProductDetailsState.initial()) {
    on<ProductDetailsRequested>(_onProductDetailsRequested);
  }

  final ProductRepository _productRepository;

  bool _isFetching = false;

  FutureOr<void> _onProductDetailsRequested(
    ProductDetailsRequested event,
    Emitter<ProductDetailsState> emit,
  ) async {
    if (_isFetching) return;
    _isFetching = true;
    try {
      emit(state.copyWith(status: ProductDetailsStatus.loading));

      final response = await _productRepository.getProductDetails(
        uuid: event.productUuid,
        hasSimilar: event.hasSimilar,
      );

      emit(state.copyWith(
        status: ProductDetailsStatus.populated,
        product: response,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: ProductDetailsStatus.failure));
      addError(error, stackTrace);
    } finally {
      _isFetching = false;
    }
  }
}
