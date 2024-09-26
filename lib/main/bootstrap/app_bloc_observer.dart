import 'dart:async';
import 'dart:developer';

// import 'package:analytics_repository/analytics_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/favorites/bloc/favorites_bloc.dart';
import 'package:meno_shop/home/bloc/home_bloc.dart';
import 'package:meno_shop/products/products.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver({
    required StreamController<Exception> exceptionStream,
  }) : _exceptionStream = exceptionStream;

  final StreamController<Exception> _exceptionStream;

  // Blocs that will not be logged
  final invalidBlocs = {CategoriesBloc, HomeBloc, ProductsBloc, FavoritesBloc};

  // ANSI color codes for terminal output
  static const String reset = '\x1B[0m';
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String magenta = '\x1B[35m';

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    if (invalidBlocs.contains(bloc.runtimeType)) return;

    log('${blue}onTransition ${bloc.runtimeType}: $transition$reset');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (error is Exception) {
      _exceptionStream.add(error);
    }
    if (invalidBlocs.contains(bloc.runtimeType)) return;

    log('${red}onError ${bloc.runtimeType}: $error$reset',
        error: error, stackTrace: stackTrace);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (invalidBlocs.contains(bloc.runtimeType)) return;

    // log('${yellow}onChange ${bloc.runtimeType}: $change$reset');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (invalidBlocs.contains(bloc.runtimeType)) return;

    // log('${green}onEvent ${bloc.runtimeType}: $event$reset');
  }
}
