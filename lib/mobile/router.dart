import 'package:flutter/material.dart';
import 'drawer.dart';
import 'views/sale_page/checkout_page.dart';
import 'views/brand/brandnew.dart';
import 'views/brand/brandedit.dart';
import 'package:ymk_pos/core/models/brand.dart';

const String initialRoute = 'drawer';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'drawer':
        return MaterialPageRoute(builder: (_) => MobileDrawer());
      case 'checkout':
        return MaterialPageRoute(builder: (_) => CheckoutPage());
      case 'brandnew':
        return MaterialPageRoute(builder: (_) => BrandNew());
      case 'brandedit':
        var brand = settings.arguments as Brand;
        return MaterialPageRoute(builder: (_) => BrandEdit(brand));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route define for ${settings.name}'),
                  ),
                ));
    }
  }
}
