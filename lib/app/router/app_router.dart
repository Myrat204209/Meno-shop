import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/home/home.dart';

import 'routes_name.dart';

class AppRouter {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        name: Routes.home.replaceFirst('/', ''),
        builder: (context, state) {
          return const Banner(
            message: 'Banner Message',
            location: BannerLocation.bottomEnd,
            child: HomePage(),
          );
        },
      )
    ],
  );
}
