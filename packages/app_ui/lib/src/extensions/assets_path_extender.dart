import 'package:app_ui/app_ui.dart';

extension AssetExtender on AssetGenImage {
  String extendPath() {
    return 'packages/app_ui/$path';
  }
}
