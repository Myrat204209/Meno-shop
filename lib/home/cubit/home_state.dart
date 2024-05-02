part of 'home_cubit.dart';

enum HomeState {
  home(0),
  category(1),
  cart(2),
  favorite(3),
  profile(4);

  const HomeState(this.tabIndex);
  final int tabIndex;
}
