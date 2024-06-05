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
  });
  const HomeState.initial() : this(status: HomeStatus.initial);

  final HomeStatus status;
  final List<CategoryItem> categories;
  @override
  List<Object> get props => [
        status,
        categories,
      ];

  HomeState copyWith({
    HomeStatus? status,
    List<CategoryItem>? categories,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }
}
