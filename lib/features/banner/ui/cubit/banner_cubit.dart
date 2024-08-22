import 'package:bloc/bloc.dart';

class BannerCubit extends Cubit<int> {
  BannerCubit() : super(0);
  void setTab(int selectedBanner) => emit(selectedBanner);
}
