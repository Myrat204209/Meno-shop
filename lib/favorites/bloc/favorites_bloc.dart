import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/product/product.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const FavoritesState.initial()) {
    on<FavoritesInitRequested>(_onInitRequested);
    on<FavoritesRequested>(_onRequested);
    on<FavoritesRefreshRequested>(_onRefreshRequested);
    on<AddFavoriteRequested>(_onAdd);
    on<RemoveFavoriteRequested>(_onRemove);
    on<FavoriteButtonPressed>(_onFavoriteButtonPressed);
  }

  final ProductRepository _productRepository;

  bool _isFetching = false;

  FutureOr<void> _onRequested(
    FavoritesRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    if (_isFetching || !state.hasMoreContent) return;

    _isFetching = true;

    try {
      emit(state.copyWith(status: FavoritesStatus.loading));

      final response = await _productRepository.getFavorites();

      emit(state.copyWith(
        status: FavoritesStatus.success,
        products: {...state.products, ...response}.toList(),
        hasMoreContent: response.isNotEmpty,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FavoritesStatus.failure));
      addError(error, stackTrace);
    } finally {
      _isFetching = false;
    }
    return null;
  }

  FutureOr<void> _onRefreshRequested(
    FavoritesRefreshRequested event,
    Emitter<FavoritesState> emit,
  ) {
    emit(const FavoritesState.initial());
    add(FavoritesRequested());
  }

  FutureOr<void> _onInitRequested(
    FavoritesInitRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state.status != FavoritesStatus.initial) return;
    add(FavoritesRequested());
  }

  FutureOr<void> _onAdd(
    AddFavoriteRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FavoritesStatus.updating));

      await _productRepository.addFavorite(event.product);

      emit(state.copyWith(
        status: FavoritesStatus.updatingSuccess,
        // products: {...state.products, ...content}.toList(),
      ));

      add(FavoritesRefreshRequested());
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FavoritesStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onRemove(
    RemoveFavoriteRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FavoritesStatus.updating));

      await _productRepository.addFavorite(event.product);

      emit(state.copyWith(
        status: FavoritesStatus.updatingSuccess,
        // products: {...state.products, ...content}.toList(),
      ));

      add(FavoritesRefreshRequested());
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FavoritesStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onFavoriteButtonPressed(
    FavoriteButtonPressed event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FavoritesStatus.updating));

      final bool isFavorite =
          await _productRepository.isFavorite(event.product);
      if (isFavorite) {
        await _productRepository.removeFavorite(event.product);
      } else {
        await _productRepository.addFavorite(event.product);
      }

      emit(state.copyWith(
        status: FavoritesStatus.updatingSuccess,
        // products: {...state.products, ...content}.toList(),
      ));

      add(FavoritesRefreshRequested());
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FavoritesStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }
}
