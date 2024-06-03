part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  populated,
  failure,
}

typedef CategoryProductListMap = Map<int, List<ProductItem>>;

final class HomeState extends Equatable {
  const HomeState({
    required this.status,
    this.categories = const [],
    this.categoryProducts = const {},
  });
  const HomeState.initial() : this(status: HomeStatus.initial);

  final HomeStatus status;
  final List<CategoryItem> categories;
  final CategoryProductListMap categoryProducts;
  @override
  List<Object> get props => [
        status,
        categories,
        categoryProducts,
      ];
  HomeState updateCategoryProducts(
    int categoryId,
    List<ProductItem>? products,
  ) {
    if (products == null) return this;

    return copyWith(
      categoryProducts: {
        ...categoryProducts,
        categoryId: products,
      },
    );
  }

  HomeState copyWith({
    HomeStatus? status,
    List<CategoryItem>? categories,
    Map<int, List<ProductItem>>? categoryProducts,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      categoryProducts: categoryProducts ?? this.categoryProducts,
    );
  }
}
