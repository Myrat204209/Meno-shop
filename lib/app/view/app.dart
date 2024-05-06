// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/authentication/authentication.dart';
import 'package:meno_shop/exception_handler/exception_handler.dart';
import 'package:meno_shop/exception_handler/view/exception_handler_view.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flow_builder/flow_builder.dart';

class App extends StatelessWidget {
  const App({
    required UserRepository userRepository,
    required StreamController<Exception> exceptionStream,
    super.key,
  })  : _userRepository = userRepository,
        _exceptionStream = exceptionStream;

  final UserRepository _userRepository;
  final StreamController<Exception> _exceptionStream;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              userRepository: _userRepository,
            ),
          ),
          BlocProvider(
            create: (_) => ExceptionHandlerBloc(
              exceptionStream: _exceptionStream,
            ),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state.status == AuthenticationStatus.authenticated) {
                  //TODO: Authenticated
                } else if (state.status ==
                    AuthenticationStatus.unauthenticated) {
                  //TODO: Unauthenticated
                }
              },
            ),
          ],
          child: AppView(
            exceptionStream: _exceptionStream,
          ),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
    required this.exceptionStream,
  });
  final StreamController<Exception> exceptionStream;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '.shop',
      theme: ThemeData(
        scaffoldBackgroundColor: UIColors.quaterniary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: UIColors.secondary,
        ),
        fontFamily: 'Poppins',
      ),
      home: ExceptionHandlerView(
        child: FlowBuilder<AuthenticationStatus>(
          state: context.select(
            (AuthenticationBloc bloc) => bloc.state.status,
          ),
          onGeneratePages: onGenerateAppViewPages,
          // onGeneratePages: onGenerateAppViewPages,
        ),
      ),
    );
  }
}
