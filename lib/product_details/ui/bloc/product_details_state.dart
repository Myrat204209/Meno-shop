part of 'product_details_bloc.dart';

enum ProductDetailsStatus {
  /// Initial state before any action is taken
  initial,

  /// Loading the list of products
  loading,

  /// Products have been successfully loaded
  populated,

  /// Failed to load products
  failure,
}

final class ProductDetailsState extends Equatable {
  const ProductDetailsState({
    required this.status,
    this.product,
  });

  const ProductDetailsState.initial()
      : this(status: ProductDetailsStatus.initial);

  final ProductDetailsStatus status;
  final ProductItem? product;
  @override
  List<Object?> get props => [status, product];

  ProductDetailsState copyWith({
    ProductDetailsStatus? status,
    ProductItem? product,
  }) {
    return ProductDetailsState(
      status: status ?? this.status,
      product: product ?? this.product,
    );
  }
}
