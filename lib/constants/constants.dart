import 'package:data_provider/data_provider.dart';

const kDefaultBaseUrl = 'http://192.168.1.116:3000';
// const kDefaultBaseUrl = 'http://10.10.16.73:3000';

extension ImagePathExtender on String {
  String fullPath() {
    return '$kDefaultBaseUrl/$this';
  }
}

extension LocaleChanger on LanguageModel {
  String changeLocale(String locale) {
    return locale == 'tk' ? tm ?? 'testTm' : ru ?? 'testRu';
  }
}
