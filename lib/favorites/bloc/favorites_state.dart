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
    this.favorites = const [],
  });

  const FavoritesState.initial() : this(status: FavoritesStatus.initial);

  final FavoritesStatus status;
  final List<ProductItem> favorites;

  @override
  List<Object> get props => [status, favorites];

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<ProductItem>? favorites,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
    );
  }
}
