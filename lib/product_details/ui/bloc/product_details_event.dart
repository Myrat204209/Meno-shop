part of 'product_details_bloc.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

final class ProductDetailsRequested extends ProductDetailsEvent {
  final String productUuid;
  final bool hasSimilar;
  const ProductDetailsRequested({
    required this.productUuid,
    this.hasSimilar = true,
  });

  @override
  List<Object> get props => [productUuid];
}
