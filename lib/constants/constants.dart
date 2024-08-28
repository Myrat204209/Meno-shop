const kDefaultBaseUrl = 'http://192.168.1.108:3000';

extension ImagePathExtender on String {
  String fullPath() {
    return '$kDefaultBaseUrl/$this';
  }
}
