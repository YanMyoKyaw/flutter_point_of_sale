import 'package:flutter/material.dart';
import 'drawer.dart';
import 'views/sale_page/checkout_page.dart';
import 'views/brand/brandnew.dart';

const String initialRoute = 'drawer';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'drawer':
        return MaterialPageRoute(builder: (_) => MobileDrawer());
      case 'checkout':
        return MaterialPageRoute(builder: (_) => CheckoutPage());
      case 'brandnew':
        return MaterialPageRoute(builder: (_) => BrandNew());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route define for ${settings.name}'),
          ),
        ));
    }
  }
}
