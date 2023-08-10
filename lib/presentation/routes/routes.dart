import 'package:flutter/material.dart';
import 'package:not_amazon/presentation/error_page.dart';
import 'package:not_amazon/presentation/home_page.dart';

import '../cart_page.dart';
import '../favorite_page.dart';
import '../product_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case '/favorites':
        return MaterialPageRoute(builder: (_) => const FavoritesPage());
      case '/cart':
        return MaterialPageRoute(builder: (_) => const CartPage());
      case '/product':
        if(args is String) {
          return MaterialPageRoute(
          builder: (_) => ProductPage(appBarTitle: args),
        );
        } else {
          return MaterialPageRoute(builder: (_) => const ErrorPage());
        }

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}