import 'package:flutter/material.dart';
import 'views/sale_page/sale_page_view.dart';

class DrawerItem {
  String title;
  IconData iconData;
  DrawerItem(this.title, this.iconData);
}

List<DrawerItem> drawerItems = [
  DrawerItem('Sale', Icons.shop),
];

class MobileDrawer extends StatefulWidget {
  @override
  _MobileDrawerState createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('Ymk'), accountEmail: null),
            Column(
              children: getDrawerOption(),
            )
          ],
        ),
      ),
      body: getDrawerWidget(selectIndex),
    );
  }

  getDrawerWidget(int index) {
    switch (index) {
      case 0:
        return SalePage();
    }
  }

  List<Widget> getDrawerOption() {
    List<Widget> listWidget = [];
    for (int i = 0; i < drawerItems.length; i++) {
      var drawerItem = drawerItems[i];
      listWidget.add(ListTile(
        leading: Icon(drawerItem.iconData),
        title: Text(drawerItem.title),
        selected: i == selectIndex,
        onTap: () {
          setState(() {
            selectIndex = i;
          });
          Navigator.pop(context);
        },
      ));
    }
    return listWidget;
  }
}
