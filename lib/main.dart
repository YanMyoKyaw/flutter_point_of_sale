import 'package:flutter/material.dart';
import 'mobile/drawer.dart';
import 'mobile/views/sale_page/checkout_page.dart';
import 'mobile/views/brand/brandnew.dart';
import 'locator.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routers = <String, WidgetBuilder>{
      CheckoutPage.tag: (context) => CheckoutPage(),
      BrandNew.tag: (context) => BrandNew(),
    };

    return MaterialApp(
      title: 'YMK Pos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MobileDrawer(),
      routes: routers,
    );
  }
}
