import 'package:dio/dio.dart';

/// Signature for the accept language provider.
typedef LanguageProvider = Future<String?> Function();

/// Language adder for the request header
/// `Accept-Language`: `<language>`
///

class LanguageInterceptor extends Interceptor {
  /// Constructor
  LanguageInterceptor({
    required LanguageProvider languageProvider,
  }) : _languageProvider = languageProvider;

  final LanguageProvider _languageProvider;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //fetching language
    final language = await _languageProvider();
    final modifiedLanguage = switch (language) {
      'tk' => 'tm',
      null => 'tm',
      _ => language,
    };
    options.headers.addAll({'Accept-Language': modifiedLanguage});
    return handler.next(options);
  }
}
