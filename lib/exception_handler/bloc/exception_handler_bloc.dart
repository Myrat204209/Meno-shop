import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show immutable;
import 'package:dio/dio.dart';

part 'exception_handler_event.dart';
part 'exception_handler_state.dart';

class ExceptionHandlerBloc
    extends Bloc<ExceptionHandlerEvent, ExceptionHandlerState> {
  ExceptionHandlerBloc({
    required StreamController<Exception> exceptionStream,
  }) : super(const ExceptionHandlerState()) {
    on<ExceptionAdded>(_onExceptionAdded);
    on<ExceptionRemoved>(_onExceptionRemoved);

    exceptionStream.stream.listen((error) => add(ExceptionAdded(error)));
  }

  FutureOr<void> _onExceptionAdded(
    ExceptionAdded event,
    Emitter<ExceptionHandlerState> emit,
  ) {
    final error = event.error;

    if (state.error != error) {
      // String title = error.runtimeType.toString();
      String content = error.toString();
      DioException? dioException;

      /// Function to check for dio exceptions
      void checkForDioException(Object exception) {
        if (exception is DioException) {
          dioException = exception;
        }
      }

      /// UserException
      content = error.toString();
      checkForDioException(error);

      /// DioException badResponse
      if (dioException?.type == DioExceptionType.badResponse) {
        try {
          // title = dioException?.response?.data['message'] ?? content;
          content = dioException?.response?.data['message'] ?? content;
        } catch (_) {}
      }

      emit(ExceptionHandlerState(
        error: error,
        // title: title,
        content: content,
        dioException: dioException,
      ));
    }
  }

  FutureOr<void> _onExceptionRemoved(
    ExceptionRemoved event,
    Emitter<ExceptionHandlerState> emit,
  ) {
    emit(const ExceptionHandlerState(error: null));
  }
}
