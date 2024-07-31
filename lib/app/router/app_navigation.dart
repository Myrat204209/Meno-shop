import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/account/account.dart';
import 'package:meno_shop/addresses/address.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/favorites/view/favorites_page.dart';
import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/notification/notification.dart';
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
    debugLogDiagnostics: true,
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
                path: '/home',
                name: 'Home',
                builder: (context, state) => HomePage(
                  key: state.pageKey,
                ),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'notifications',
                    name: 'Notifications',
                    builder: (context, state) =>
                        NotificationsPage(key: state.pageKey),
                  ),
                  GoRoute(
                    path: 'products/:uuid',
                    name: 'Product_Details',
                    builder: (context, state) => ProductDetailsPage(
                      key: state.pageKey,
                      uuid: state.pathParameters['uuid'],
                      //TODO: Change to actual product
                      product: const ProductItem(),
                    ),
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
                path: '/category',
                name: 'Category',
                builder: (context, state) => CategoriesPage(key: state.pageKey),
              ),
            ],
          ),

          /// Branches for CartPage
          StatefulShellBranch(
            navigatorKey: _rootNavigatorCart,
            routes: <RouteBase>[
              GoRoute(
                path: '/cart',
                name: 'Cart',
                builder: (context, state) => CartPage(key: state.pageKey),
              ),
            ],
          ),

          /// Branches for FavoritesPage
          StatefulShellBranch(
            navigatorKey: _rootNavigatorFavorites,
            routes: <RouteBase>[
              GoRoute(
                path: '/favorites',
                name: 'Favorites',
                builder: (context, state) => FavoritesPage(key: state.pageKey),
              ),
            ],
          ),

          /// Branches for ProfilePage
          StatefulShellBranch(
            navigatorKey: _rootNavigatorProfile,
            routes: <RouteBase>[
              GoRoute(
                path: '/profile',
                name: 'Profile',
                builder: (context, state) => ProfilePage(key: state.pageKey),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'account',
                    name: 'Account',
                    builder: (context, state) =>
                        AccountPage(key: state.pageKey),
                  ),
                  GoRoute(
                    path: 'address',
                    name: 'My_Addresses',
                    builder: (context, state) => const AddressPage(),
                  ),
                  GoRoute(
                    path: 'orders',
                    name: 'Orders',
                    builder: (context, state) => const OrdersPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/category_products',
        name: 'Category_Products',
        builder: (context, state) => CategoryProductsPage(
          key: state.pageKey,
        ),
      ),
    ],
  );
}
