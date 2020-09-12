import 'package:flutter/material.dart';
import 'mobile/drawer.dart';
import 'mobile/views/sale_page/checkout_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final routers = <String, WidgetBuilder>{
      CheckoutPage.tag: (context) => CheckoutPage(),
    };

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MobileDrawer(),
      routes: routers,
    );
  }
}
