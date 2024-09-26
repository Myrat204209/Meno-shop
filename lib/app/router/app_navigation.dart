
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/account/account.dart';
import 'package:meno_shop/addresses/address.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/checkout/ui/view/checkout_page.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/notification/notification.dart';
import 'package:meno_shop/order_information/order_information.dart';
import 'package:meno_shop/orders/orders.dart';
import 'package:meno_shop/product_details/product_details.dart';
import 'package:meno_shop/profile/profile.dart';

class AppNavigation {
  AppNavigation._();

  static const String initR = '/home';

  ///Private navigator keys
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorCategory =
      GlobalKey<NavigatorState>(debugLabel: 'shellCategory');
  static final _rootNavigatorCart =
      GlobalKey<NavigatorState>(debugLabel: 'shellCart');
  static final _rootNavigatorFavorites =
      GlobalKey<NavigatorState>(debugLabel: 'shellFavorites');
  static final _rootNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  /// Go Router Configuration
  static final GoRouter router = GoRouter(
    // debugLogDiagnostics: true,
    initialLocation: initR,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      /// HomeScreen
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => HomeScreen(
          navigationShell: navigationShell,
        ),
        branches: <StatefulShellBranch>[
          /// Branches for HomePage
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: RouteNames.home.path,
                name: RouteNames.home.name,
                builder: (context, state) => HomePage(
                  key: state.pageKey,
                ),
                routes: <RouteBase>[
                  GoRoute(
                    path: RouteNames.notifications.path,
                    name: RouteNames.notifications.name,
                    builder: (context, state) =>
                        NotificationsPage(key: state.pageKey),
                  ),
                ],
              ),
            ],
          ),

          /// Branches for CategoryPage
          StatefulShellBranch(
            navigatorKey: _rootNavigatorCategory,
            routes: <RouteBase>[
              GoRoute(
                path: RouteNames.category.path,
                name: RouteNames.category.name,
                builder: (context, state) => CategoriesPage(key: state.pageKey),
              ),
            ],
          ),

          /// Branches for CartPage
          StatefulShellBranch(
            navigatorKey: _rootNavigatorCart,
            routes: <RouteBase>[
              GoRoute(
                path: RouteNames.cart.path,
                name: RouteNames.cart.name,
                builder: (context, state) => CartPage(key: state.pageKey),
                routes: <RouteBase>[
                  GoRoute(
                    path: RouteNames.checkout.path,
                    name: RouteNames.checkout.name,
                    builder: (context, state) => const CheckoutPage(),
                    // redirect: (context, state) {
                    //   final isAuthenticated =
                    //       BlocProvider.of<AuthBloc>(context, listen: false)
                    //           .state
                    //           .isAuthenticated;
                    //   log('-------------------AuthenticationStatus: $isAuthenticated--------------------------------');
                    //   if (!isAuthenticated) {
                    //     return RouteNames.auth.path;
                    //     // '/auth';
                    //     // context.pushNamed(RouteNames.auth.path);
                    //   }
                    //   return null;
                    // },
                  ),
                ],
              ),
            ],
          ),

          /// Branches for FavoritesPage
          StatefulShellBranch(
            navigatorKey: _rootNavigatorFavorites,
            routes: <RouteBase>[
              GoRoute(
                path: RouteNames.favorites.path,
                name: RouteNames.favorites.name,
                builder: (context, state) => FavoritesPage(key: state.pageKey),
              ),
            ],
          ),

          /// Branches for ProfilePage
          StatefulShellBranch(
            navigatorKey: _rootNavigatorProfile,
            routes: <RouteBase>[
              GoRoute(
                path: RouteNames.profile.path,
                name: RouteNames.profile.name,
                builder: (context, state) => ProfilePage(key: state.pageKey),
                routes: <RouteBase>[
                  GoRoute(
                    path: RouteNames.account.path,
                    name: RouteNames.account.name,
                    builder: (context, state) =>
                        AccountPage(key: state.pageKey),
                  ),
                  GoRoute(
                    path: RouteNames.addresses.path,
                    name: RouteNames.addresses.name,
                    builder: (context, state) => const AddressPage(),
                  ),
                  GoRoute(
                      path: RouteNames.orders.path,
                      name: RouteNames.orders.name,
                      builder: (context, state) => const OrdersPage(),
                      routes: <RouteBase>[
                        GoRoute(
                          path: RouteNames.orderInformation.path,
                          name: RouteNames.orderInformation.name,
                          builder: (context, state) =>
                              OrderInformationPage(key: state.pageKey),
                        ),
                      ]),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RouteNames.productDetails.path,
        name: RouteNames.productDetails.name,
        builder: (context, state) => ProductDetailsPage(
          key: state.pageKey,
          uuid: state.pathParameters['uuid']!,
        ),
      ),
      GoRoute(
        path: RouteNames.products.path,
        name: RouteNames.products.name,
        builder: (context, state) => ProductsPage(
          key: state.pageKey,
          // categoryName: (state.extra as List<String>)[0],
          // subcategoryName: (state.extra as List<String>)[1],
          subcategoryId: state.pathParameters['uuid']!,
        ),
      ),
      GoRoute(
        path: RouteNames.auth.path,
        name: RouteNames.auth.name,
        builder: (context, state) => LoginPage(
          key: state.pageKey,
        ),
        routes: <RouteBase>[
          GoRoute(
            path: RouteNames.authVerify.path,
            name: RouteNames.authVerify.name,
            builder: (context, state) => OtpVerifyPage(
              key: state.pageKey,
              phone: state.extra as String,
            ),
          ),
        ],
      ),
    ],
  );
}
