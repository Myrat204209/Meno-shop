// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  populated,
  failure,
}

typedef CategoryProductListMap = Map<String, List<ProductItem>>;

final class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.bannerStatus,
    this.banners = const [],
    this.categories = const [],
    this.categoryProducts = const {},
  });

  const HomeState.initial()
      : this(
          status: HomeStatus.initial,
          bannerStatus: HomeStatus.loading,
        );

  final HomeStatus status;
  final List<CategoryItem> categories;
  final CategoryProductListMap categoryProducts;

  final HomeStatus bannerStatus;
  final List<BannerItem> banners;

  @override
  List<Object> get props => [
        status,
        categories,
        categoryProducts,
        bannerStatus,
        banners,
      ];

  HomeState updateCategoryProducts(
    String categoryId,
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
    Map<String, List<ProductItem>>? categoryProducts,
    HomeStatus? bannerStatus,
    List<BannerItem>? banners,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      categoryProducts: categoryProducts ?? this.categoryProducts,
      bannerStatus: bannerStatus ?? this.bannerStatus,
      banners: banners ?? this.banners,
    );
  }
}
