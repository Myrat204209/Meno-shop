part of 'app_cubit.dart';

enum AppState {
  home(0),
  category(1),
  cart(2),
  favorite(3),
  profile(4);

  const AppState(this.tabIndex);
  final int tabIndex;
}
