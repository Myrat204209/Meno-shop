// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'favorites_bloc.dart';

enum FavoritesStatus {
  initial,
  loading,
  success,
  failure,

  updating,
  updatingSuccess,
  updatingFailure,
}

class FavoritesState extends Equatable {
  const FavoritesState({
    required this.status,
    this.products = const [],
    this.hasMoreContent = true,
  });

  const FavoritesState.initial() : this(status: FavoritesStatus.initial);

  final FavoritesStatus status;
  final List<ProductItem> products;
  final bool hasMoreContent;

  @override
  List<Object> get props => [status, products, hasMoreContent];

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<ProductItem>? products,
    bool? hasMoreContent,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasMoreContent: hasMoreContent ?? this.hasMoreContent,
    );
  }
}
