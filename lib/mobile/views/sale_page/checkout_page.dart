import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static String tag = "checkout_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 100,
                    child: Text(
                      'cocola',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 70,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        items:
                            getDropDownItems(['Box', 'Single', 'components']),
                        value: 'Box',
                        onChanged: (value) {},
                        // decoration: InputDecoration.collapsed(hintText: ''),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('10'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.blue,
                      )
                    ],
                  ),
                  Text('100')
                ],
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: 20,
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropDownItems(List<String> items) {
    List<DropdownMenuItem<String>> ditems = new List();
    for (String item in items) {
      ditems.add(
        DropdownMenuItem(
          value: item,
          child: new Text(
            item,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
    return ditems;
  }
}
