import 'package:data_provider/data_provider.dart';
import 'package:hive/hive.dart';

/// Hive box keys for the [Hive].
abstract class HiveBoxKeys {
  /// User addresses.
  static const userAddresses = '__user_addresses_key__';
  static const userFavorites = '__user_favorites_key__';
  static const userCart = '__user_cart_key__';
}

/// User adresses box
typedef UserAddressBox = Box<AddressModel>;

/// User favorites box
typedef UserFavoritesBox = Box<ProductItem>;

/// User cart box
typedef UserCartBox = Box<CartItem>;
