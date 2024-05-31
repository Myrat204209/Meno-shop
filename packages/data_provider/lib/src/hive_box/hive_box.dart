import 'package:data_provider/data_provider.dart';
import 'package:hive/hive.dart';

/// Hive box keys for the [Hive].
abstract class HiveBoxKeys {
  /// User addresses.
  static const userAddresses = '__user_addresses_key__';
}

/// User adresses box
typedef UserAddressBox = Box<AddressModel>;
