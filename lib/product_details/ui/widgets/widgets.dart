import 'package:app_ui/app_ui.dart';

export 'product_details_app_bar.dart';
export 'product_details_content.dart';
export 'product_details_color_selector.dart';
export 'product_details_size_selector.dart';
export 'product_details_image_slider.dart';
export 'product_details_similar_products.dart';
export 'product_details_texts.dart';
export 'product_details_visit_counter.dart';
export 'product_details_cart_counter.dart';

final kAppTitleTextStyle = const AppTextStyle.text().semiBold().lg();
const List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

const productDetailsColors = [
  AppColors.accepted,
  AppColors.primary,
  AppColors.secondary,
  AppColors.secondary2,
];
