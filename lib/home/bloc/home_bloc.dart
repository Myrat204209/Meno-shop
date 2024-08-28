import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/subcategories/subcategories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required SubcategoryRepository subcategoryRepository,
    required BannerRepository bannerRepository,
  })  : _subcategoryRepository = subcategoryRepository,
        _bannerRepository = bannerRepository,
        super(const HomeState.initial()) {
    on<HomeRequested>(_onHomeRequested);
    on<HomeBannersRequested>(_onHomeBannersRequested);
  }
  final SubcategoryRepository _subcategoryRepository;
  final BannerRepository _bannerRepository;
  FutureOr<void> _onHomeRequested(
    HomeRequested event,
    Emitter<HomeState> emit,
  ) async {
    add(HomeBannersRequested());

    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final subcategories = await _subcategoryRepository.getSubcategories(
        GetQueryParameters(
          populate: ['products'],
          isActive: true,
          limit: 100,
          offset: 0,
        ),
      );
      emit(state.copyWith(
        status: HomeStatus.populated,
        subcategories: subcategories,
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
