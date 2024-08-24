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

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Sections'**
  String get services;

  /// No description provided for @entryPage.
  ///
  /// In en, this message translates to:
  /// **'Homepage'**
  String get entryPage;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

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

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @profileEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEdit;

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

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

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

  /// No description provided for @manageAddressesTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Addresses'**
  String get manageAddressesTitle;

  /// No description provided for @manageAddressesDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage your addresses'**
  String get manageAddressesDescription;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

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

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @orderTotal.
  ///
  /// In en, this message translates to:
  /// **'Order Total'**
  String get orderTotal;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get orders;

  /// No description provided for @ordersEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No Orders'**
  String get ordersEmptyTitle;

  /// No description provided for @ordersEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Your orders are displayed here'**
  String get ordersEmptyDescription;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @productSize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get productSize;

  /// No description provided for @productColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get productColor;

  /// No description provided for @productPrice.
  ///
  /// In en, this message translates to:
  /// **'Price per item'**
  String get productPrice;

  /// No description provided for @productsAll.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsAll;

  /// No description provided for @addresses.
  ///
  /// In en, this message translates to:
  /// **'My Addresses'**
  String get addresses;

  /// No description provided for @addressesCreate.
  ///
  /// In en, this message translates to:
  /// **'Add a new address'**
  String get addressesCreate;

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

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Continue shopping'**
  String get confirm;

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Select when to deliver'**
  String get deliveryTime;

  /// No description provided for @deliverySerice.
  ///
  /// In en, this message translates to:
  /// **'Delivery service'**
  String get deliverySerice;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

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

  /// No description provided for @goToTheCart.
  ///
  /// In en, this message translates to:
  /// **'Go to Cart'**
  String get goToTheCart;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total price'**
  String get total;

  /// No description provided for @totalCost.
  ///
  /// In en, this message translates to:
  /// **'Total Cost of goods'**
  String get totalCost;

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

  /// No description provided for @orderType.
  ///
  /// In en, this message translates to:
  /// **'Order Type'**
  String get orderType;

  /// No description provided for @orderConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirm cart'**
  String get orderConfirmation;

  /// No description provided for @orderNotes.
  ///
  /// In en, this message translates to:
  /// **'Order Notes'**
  String get orderNotes;

  /// No description provided for @orderNotesDescription.
  ///
  /// In en, this message translates to:
  /// **'Additional instructions or notes for the order'**
  String get orderNotesDescription;

  /// No description provided for @orderNotesDescription2.
  ///
  /// In en, this message translates to:
  /// **'Additional instructions, allergies, preferences'**
  String get orderNotesDescription2;

  /// No description provided for @selectAddress.
  ///
  /// In en, this message translates to:
  /// **'Select Address'**
  String get selectAddress;

  /// No description provided for @selectAddressEmpty.
  ///
  /// In en, this message translates to:
  /// **'Not Selected'**
  String get selectAddressEmpty;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get cart;

  /// No description provided for @cartAdd.
  ///
  /// In en, this message translates to:
  /// **'added to cart'**
  String get cartAdd;

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

  /// No description provided for @placeAnOrder.
  ///
  /// In en, this message translates to:
  /// **'Place an Order'**
  String get placeAnOrder;

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

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

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
