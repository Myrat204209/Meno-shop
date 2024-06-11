// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  populated,
  failure,
}

final class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.bannerStatus,
    this.banners = const [],
    this.subcategories = const [],
  });

  const HomeState.initial()
      : this(
          status: HomeStatus.initial,
          bannerStatus: HomeStatus.loading,
        );

  final HomeStatus status;
  final List<SubcategoryItem> subcategories;

  final HomeStatus bannerStatus;
  final List<BannerItem> banners;

  @override
  List<Object> get props => [
        status,
        subcategories,
        bannerStatus,
        banners,
      ];

  HomeState copyWith({
    HomeStatus? status,
    List<SubcategoryItem>? subcategories,
    HomeStatus? bannerStatus,
    List<BannerItem>? banners,
  }) {
    return HomeState(
      status: status ?? this.status,
      subcategories: subcategories ?? this.subcategories,
      bannerStatus: bannerStatus ?? this.bannerStatus,
      banners: banners ?? this.banners,
    );
  }
}
