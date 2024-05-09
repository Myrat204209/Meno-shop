import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Dio extended custom Http Client
class Http extends DioForNative {
  /// Default base url
  final String _defaultBaseUrl;

  /// Construct a new Http
  /// Add all interceptors
  Http({
    required String defaultBaseUrl,
    required TokenProvider tokenProvider,
  })  : _defaultBaseUrl = defaultBaseUrl,
        super(
          BaseOptions(
            baseUrl: defaultBaseUrl,
            connectTimeout: const Duration(milliseconds: 10000),
            receiveTimeout: const Duration(milliseconds: 10000),
          ),
        ) {
    interceptors.addAll([
      TokenHandleInterceptor(
        tokenProvider: tokenProvider,
      ),
      const AlwaysAcceptApplicationJsonInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        compact: false,
      ),
    ]);
  }

  /// If given value is null default is used
  void updateBaseUrl(String? baseUrl) {
    options.baseUrl = baseUrl ?? _defaultBaseUrl;
  }
}