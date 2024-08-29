import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get networkError => 'No internet connection.';

  @override
  String get networkErrorDescription => 'Please try again later.';

  @override
  String get networkErrorButton => 'Try Again';

  @override
  String get notification => 'Notification';

  @override
  String get unreadMessage => 'New';

  @override
  String get technicalSupportTitle => 'Technical Support';

  @override
  String get technicalSupportDescription => 'Contact us for assistance';

  @override
  String get language => 'Language';

  @override
  String get languageChangeTitle => 'Change Language';

  @override
  String get languageSelectDescription => 'Choose the application language';

  @override
  String get searching => 'Search from shop...';

  @override
  String get startShopping => 'Shop now';

  @override
  String get loadMore => 'Load more';

  @override
  String get merchLabel => 'For Traders';

  @override
  String get merchTitle => 'Special Offers';

  @override
  String get merchSubtitle => 'All products, wholesale price';

  @override
  String get viewAll => 'View all';

  @override
  String get productDetails => 'Product Details';

  @override
  String get chooseColor => 'Choose color';

  @override
  String get selectSize => 'Select size';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get similarProducts => 'Similar products';

  @override
  String get filter => 'Filter';

  @override
  String get selectAll => 'Select all';

  @override
  String productsAll(int products) {
    return 'Products ($products)';
  }

  @override
  String get close => 'Close';

  @override
  String get cart => 'My cart';

  @override
  String get removeAll => 'Remove all';

  @override
  String get cartConfirmation => 'Confirm cart';

  @override
  String get totalPrice => 'Total price';

  @override
  String get price => 'Price';

  @override
  String get totalCost => 'Total Cost of goods';

  @override
  String get deliverySerice => 'Delivery service';

  @override
  String get discount => 'Discount';

  @override
  String get cartClearTitle => 'Remove products';

  @override
  String get cartClearContent => 'Do you want all products removed?';

  @override
  String get neglection => 'No';

  @override
  String get affirmation => 'Yes';

  @override
  String get checkOutCompleteTitle => 'Your order has been registered.';

  @override
  String get checkOutCompleteContent => 'The completed trade will be added to you at the specified time. Thank you for your shopping!';

  @override
  String get continueShop => 'Continue shopping';

  @override
  String get paymentMethod => 'Types of payment';

  @override
  String get paymentMethodCash => 'Cash';

  @override
  String get paymentMethodTerminal => 'Terminal';

  @override
  String get selectAddress => 'Select address';

  @override
  String get deliveryTime => 'Select when to deliver';

  @override
  String get selectAddressEmpty => 'Not Selected';

  @override
  String get addressesCreate => 'Add a new address';

  @override
  String get myAddresses => 'My Addresses';

  @override
  String get address => 'Address';

  @override
  String get addressName => 'Address name';

  @override
  String get name => 'Name';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get save => 'Save';

  @override
  String get favorites => 'Favorites';

  @override
  String get profile => 'My profile';

  @override
  String get account => 'Account';

  @override
  String get orders => 'Orders';

  @override
  String get orderInformation => 'Order information';

  @override
  String get logout => 'Logout';

  @override
  String get region => 'Region';

  @override
  String get accepted => 'Accepted';

  @override
  String get expected => 'Expected';

  @override
  String get success => 'Success';

  @override
  String get cancel => 'Cancel';

  @override
  String get cartEmptyTitle => 'Cart is Empty';

  @override
  String get cartEmptyDescription => 'Items in your cart are displayed here';

  @override
  String get productsEmptyTitle => 'No Products Found';

  @override
  String get productsEmptyDescription => 'No products available at this time.';

  @override
  String get submit => 'Submit';

  @override
  String get phoneInput => 'Enter your phone number!';

  @override
  String get otpSending => 'We will send an OTP code to your phone number!';

  @override
  String get acceptPolice => 'By continuing I accept the privacy policy and terms of use';

  @override
  String get getCode => 'Get Code';

  @override
  String get otpEnter => 'Enter the OTP code!';

  @override
  String otpSentInformation(String phoneNumber) {
    return 'We have sent the OTP code to +$phoneNumber!';
  }

  @override
  String get otpError => 'Code not received.';

  @override
  String get sendAgain => 'Send again';

  @override
  String get authSucess => 'Successfully created!';

  @override
  String get ok => 'Ok';
}
