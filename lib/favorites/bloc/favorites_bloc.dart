import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/products/products.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const FavoritesState.initial()) {
    on<FavoritesInitRequested>(_onInitRequested);
    on<FavoritesRequested>(_onRequested);
    on<FavoriteButtonPressed>(_onFavoriteButtonPressed);
  }

  final ProductRepository _productRepository;
  FutureOr<void> _onInitRequested(
    FavoritesInitRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state.status != FavoritesStatus.initial) return;
    add(FavoritesRequested());
  }

  FutureOr<void> _onRequested(
    FavoritesRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FavoritesStatus.loading));

      final response = await _productRepository.getFavoritesList();

      emit(state.copyWith(
        status: FavoritesStatus.success,
        favorites: response,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FavoritesStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onFavoriteButtonPressed(
    FavoriteButtonPressed event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FavoritesStatus.updating));

      await _productRepository.favoritePressed(event.productUuid);
      emit(state.copyWith(
        status: FavoritesStatus.updatingSuccess,
      ));

      add(FavoritesRequested());
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FavoritesStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  bool isFavorite(String uuid) {
    return _productRepository.isFavorite(uuid);
  }
}
