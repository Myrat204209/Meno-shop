import 'package:data_provider/data_provider.dart';
import 'package:data_provider/src/api/interceptors/language_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Dio extended custom Http Client
class Http extends DioForNative {
  /// Default base url
  final String _defaultBaseUrl;

  /// Construct a new Http
  Http({
    required String defaultBaseUrl,
    required TokenProvider? tokenProvider,
    required LanguageProvider? languageProvider,
    bool enableLogger = true,
  })  : _defaultBaseUrl = defaultBaseUrl,
        super(
          BaseOptions(
            baseUrl: defaultBaseUrl,
            connectTimeout: const Duration(milliseconds: 10000),
            receiveTimeout: const Duration(milliseconds: 10000),
          ),
        ) {
    /// Add all interceptors
    interceptors.addAll([
      /// Token Interceptor
      if (tokenProvider != null)
        TokenHandleInterceptor(
          tokenProvider: tokenProvider,
        ),

      /// Language interceptor
      if (languageProvider != null)
        LanguageInterceptor(
          languageProvider: languageProvider,
        ),

      /// Additional interceptor
      const AlwaysAcceptApplicationJsonInterceptor(),

      /// Pretty logger interceptor
      if (enableLogger)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          enabled: true,
          compact: true,
        ),
    ]);
  }

  /// If given value is null default is used
  void updateBaseUrl(String? baseUrl) {
    options.baseUrl = baseUrl ?? _defaultBaseUrl;
  }
}
