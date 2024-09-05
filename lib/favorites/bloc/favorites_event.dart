part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class FavoritesInitRequested extends FavoritesEvent {}

final class FavoritesRequested extends FavoritesEvent {}

final class FavoritesRefreshRequested extends FavoritesEvent {}

final class FavoriteButtonPressed extends FavoritesEvent {
  final String productUuid;

  const FavoriteButtonPressed(this.productUuid);

  @override
  List<Object> get props => [productUuid];
}
