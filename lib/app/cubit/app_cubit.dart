// import 'package:bloc/bloc.dart';

// part 'app_state.dart';

// class AppCubit extends Cubit<AppState> {
//   static int _lastSelectedTab = 0;

//   AppCubit() : super(_getStateFromIndex(_lastSelectedTab));

//   void setTab(int selectedTab) {
//     _lastSelectedTab = selectedTab;
//     emit(_getStateFromIndex(selectedTab));
//   }

//   static AppState _getStateFromIndex(int index) {
//     switch (index) {
//       case 0:
//         return AppState.home;
//       case 1:
//         return AppState.category;
//       case 2:
//         return AppState.cart;
//       case 3:
//         return AppState.favorite;
//       case 4:
//         return AppState.profile;
//       default:
//         return AppState.home;
//     }
//   }
// }
