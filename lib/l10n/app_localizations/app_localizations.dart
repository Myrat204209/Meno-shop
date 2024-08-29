import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'app_localizations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('tk')
  ];

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get networkError;

  /// No description provided for @networkErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Please try again later.'**
  String get networkErrorDescription;

  /// No description provided for @networkErrorButton.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get networkErrorButton;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @unreadMessage.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get unreadMessage;

  /// No description provided for @technicalSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical Support'**
  String get technicalSupportTitle;

  /// No description provided for @technicalSupportDescription.
  ///
  /// In en, this message translates to:
  /// **'Contact us for assistance'**
  String get technicalSupportDescription;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageChangeTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get languageChangeTitle;

  /// No description provided for @languageSelectDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose the application language'**
  String get languageSelectDescription;

  /// No description provided for @searching.
  ///
  /// In en, this message translates to:
  /// **'Search from shop...'**
  String get searching;

  /// No description provided for @startShopping.
  ///
  /// In en, this message translates to:
  /// **'Shop now'**
  String get startShopping;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// No description provided for @merchLabel.
  ///
  /// In en, this message translates to:
  /// **'For Traders'**
  String get merchLabel;

  /// No description provided for @merchTitle.
  ///
  /// In en, this message translates to:
  /// **'Special Offers'**
  String get merchTitle;

  /// No description provided for @merchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'All products, wholesale price'**
  String get merchSubtitle;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @productDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetails;

  /// No description provided for @chooseColor.
  ///
  /// In en, this message translates to:
  /// **'Choose color'**
  String get chooseColor;

  /// No description provided for @selectSize.
  ///
  /// In en, this message translates to:
  /// **'Select size'**
  String get selectSize;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addToCart;

  /// No description provided for @similarProducts.
  ///
  /// In en, this message translates to:
  /// **'Similar products'**
  String get similarProducts;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get selectAll;

  /// Number of products found.
  ///
  /// In en, this message translates to:
  /// **'Products ({products})'**
  String productsAll(int products);

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'My cart'**
  String get cart;

  /// No description provided for @removeAll.
  ///
  /// In en, this message translates to:
  /// **'Remove all'**
  String get removeAll;

  /// No description provided for @cartConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirm cart'**
  String get cartConfirmation;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total price'**
  String get totalPrice;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @totalCost.
  ///
  /// In en, this message translates to:
  /// **'Total Cost of goods'**
  String get totalCost;

  /// No description provided for @deliverySerice.
  ///
  /// In en, this message translates to:
  /// **'Delivery service'**
  String get deliverySerice;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @cartClearTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove products'**
  String get cartClearTitle;

  /// No description provided for @cartClearContent.
  ///
  /// In en, this message translates to:
  /// **'Do you want all products removed?'**
  String get cartClearContent;

  /// No description provided for @neglection.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get neglection;

  /// No description provided for @affirmation.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get affirmation;

  /// No description provided for @checkOutCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Your order has been registered.'**
  String get checkOutCompleteTitle;

  /// No description provided for @checkOutCompleteContent.
  ///
  /// In en, this message translates to:
  /// **'The completed trade will be added to you at the specified time. Thank you for your shopping!'**
  String get checkOutCompleteContent;

  /// No description provided for @continueShop.
  ///
  /// In en, this message translates to:
  /// **'Continue shopping'**
  String get continueShop;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Types of payment'**
  String get paymentMethod;

  /// No description provided for @paymentMethodCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get paymentMethodCash;

  /// No description provided for @paymentMethodTerminal.
  ///
  /// In en, this message translates to:
  /// **'Terminal'**
  String get paymentMethodTerminal;

  /// No description provided for @selectAddress.
  ///
  /// In en, this message translates to:
  /// **'Select address'**
  String get selectAddress;

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Select when to deliver'**
  String get deliveryTime;

  /// No description provided for @selectAddressEmpty.
  ///
  /// In en, this message translates to:
  /// **'Not Selected'**
  String get selectAddressEmpty;

  /// No description provided for @addressesCreate.
  ///
  /// In en, this message translates to:
  /// **'Add a new address'**
  String get addressesCreate;

  /// No description provided for @myAddresses.
  ///
  /// In en, this message translates to:
  /// **'My Addresses'**
  String get myAddresses;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @addressName.
  ///
  /// In en, this message translates to:
  /// **'Address name'**
  String get addressName;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get profile;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @orderInformation.
  ///
  /// In en, this message translates to:
  /// **'Order information'**
  String get orderInformation;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @expected.
  ///
  /// In en, this message translates to:
  /// **'Expected'**
  String get expected;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cartEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Cart is Empty'**
  String get cartEmptyTitle;

  /// No description provided for @cartEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Items in your cart are displayed here'**
  String get cartEmptyDescription;

  /// No description provided for @productsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No Products Found'**
  String get productsEmptyTitle;

  /// No description provided for @productsEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'No products available at this time.'**
  String get productsEmptyDescription;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @phoneInput.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number!'**
  String get phoneInput;

  /// No description provided for @otpSending.
  ///
  /// In en, this message translates to:
  /// **'We will send an OTP code to your phone number!'**
  String get otpSending;

  /// No description provided for @acceptPolice.
  ///
  /// In en, this message translates to:
  /// **'By continuing I accept the privacy policy and terms of use'**
  String get acceptPolice;

  /// No description provided for @getCode.
  ///
  /// In en, this message translates to:
  /// **'Get Code'**
  String get getCode;

  /// No description provided for @otpEnter.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP code!'**
  String get otpEnter;

  /// Number of products found.
  ///
  /// In en, this message translates to:
  /// **'We have sent the OTP code to +{phoneNumber}!'**
  String otpSentInformation(String phoneNumber);

  /// No description provided for @otpError.
  ///
  /// In en, this message translates to:
  /// **'Code not received.'**
  String get otpError;

  /// No description provided for @sendAgain.
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get sendAgain;

  /// No description provided for @authSucess.
  ///
  /// In en, this message translates to:
  /// **'Successfully created!'**
  String get authSucess;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'tk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'tk': return AppLocalizationsTk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
