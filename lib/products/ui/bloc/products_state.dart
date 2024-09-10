// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

enum ProductsStatus {
  initial,
  loading,
  populated,
  failure,
}

final class ProductsState extends Equatable {
  const ProductsState({
    required this.status,
    this.offset = 0,
    this.products = const [],
    this.hasMoreContent = true,
    this.search,
  });

  const ProductsState.initial() : this(status: ProductsStatus.initial);

  final ProductsStatus status;
  final List<ProductItem> products;
  final bool hasMoreContent;
  final String? search;
  final int offset;
  @override
  List<Object?> get props => [
        status,
        products,
        offset,
        hasMoreContent,
        search,
      ];

  ProductsState copyWith({
    ProductsStatus? status,
    List<ProductItem>? products,
    bool? hasMoreContent,
    String? search,
    int? offset,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasMoreContent: hasMoreContent ?? this.hasMoreContent,
      search: search ?? this.search,
      offset: offset ?? this.offset,
    );
  }
}
