import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesState.initial()) {
    on<CategoriesEvent>((event, emit) {});
  }
}

//TODO: Replace with actual Category with json_serialization
class Category {
  final String? name;

  Category({required this.name});
}
