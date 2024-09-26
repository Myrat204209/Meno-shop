import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/exception_handler/exception_handler.dart';

class ExceptionHandlerView extends StatelessWidget {
  const ExceptionHandlerView({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExceptionHandlerBloc, ExceptionHandlerState>(
      listenWhen: (_, current) => current.error != null,
      listener: (context, state) {
        if (state.error != null) {
          String title = state.title;
          String content = state.content;

          if (state.dioException != null) {
            content = switch (state.dioException?.type) {
              DioExceptionType.badResponse => content,
              _ => content,
            };
          }

          if (state.dioException?.type == DioExceptionType.connectionTimeout) {
            content = 'Connection timeout';
          }

          // Capture the context
          final currentContext = context;

          showDialog(
            context: currentContext,
            builder: (_) => ExceptionDialog(
              title: title,
              content: content,
            ),
          ).then(
            // ignore: use_build_context_synchronously
            (_) => currentContext
                .read<ExceptionHandlerBloc>()
                .add(ExceptionRemoved(state.error!)),
          );
        }
      },
      child: child,
    );
  }
}
