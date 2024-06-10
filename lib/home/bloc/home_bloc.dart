import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/banner/data/data.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/product/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
    required BannerRepository bannerRepository,
  })  : _categoryRepository = categoryRepository,
        _productRepository = productRepository,
        _bannerRepository = bannerRepository,
        super(const HomeState.initial()) {
    on<HomeRequested>(_onHomeRequested);

    on<HomeBannersRequested>(_onHomeBannersRequested);
  }
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final BannerRepository _bannerRepository;
  FutureOr<void> _onHomeRequested(
    HomeRequested event,
    Emitter<HomeState> emit,
  ) async {
    add(HomeBannersRequested());

    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final categories = await _categoryRepository.getCategories();

      CategoryProductListMap map = {};

      emit(state.copyWith(
        status: HomeStatus.populated,
        categories: categories,
        categoryProducts: map,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: HomeStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onHomeBannersRequested(
    HomeBannersRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(bannerStatus: HomeStatus.loading));
      final response = await _bannerRepository.getBanners();
      emit(state.copyWith(
        bannerStatus: HomeStatus.populated,
        banners: response,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(bannerStatus: HomeStatus.failure));
      addError(error, stackTrace);
    }
  }
}
