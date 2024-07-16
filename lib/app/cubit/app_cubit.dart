import 'package:bloc/bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.category);
  void setTab(int selectedTab) {
    switch (selectedTab) {
      case 0:
        return emit(AppState.home);
      case 1:
        return emit(AppState.category);
      case 2:
        return emit(AppState.cart);
      case 3:
        return emit(AppState.favorite);
      case 4:
        return emit(AppState.profile);
    }
  }
}
