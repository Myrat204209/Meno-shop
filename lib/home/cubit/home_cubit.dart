import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.home);
  void setTab(int selectedTab) {
    switch (selectedTab) {
      case 0:
        return emit(HomeState.home);
      case 1:
        return emit(HomeState.category);
      case 2:
        return emit(HomeState.cart);
      case 3:
        return emit(HomeState.favorite);
      case 4:
        return emit(HomeState.profile);
    }
  }
}
