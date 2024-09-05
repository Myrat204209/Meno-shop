// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

enum ProductsStatus {
  initial,
  loading,
  populated,
  failure,
  singleProductLoading,
  singleProductPopulated,
  singleProductFailure,
}

final class ProductsState extends Equatable {
  const ProductsState({
    required this.status,
    this.products = const [],
    this.singleProduct,
    this.hasMoreContent = true,
    this.search,
  });

  const ProductsState.initial() : this(status: ProductsStatus.initial);

  final ProductsStatus status;
  final List<ProductItem> products;
  final ProductItem? singleProduct;

  final bool hasMoreContent;
  final String? search;

  @override
  List<Object?> get props => [
        status,
        products,
        singleProduct,
        hasMoreContent,
        search,
      ];

  ProductsState copyWith({
    ProductsStatus? status,
    List<ProductItem>? products,
    bool? hasMoreContent,
    ProductItem? singleProduct,
    String? search,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasMoreContent: hasMoreContent ?? this.hasMoreContent,
      singleProduct: singleProduct ?? this.singleProduct,
      search: search ?? this.search,
    );
  }
}
