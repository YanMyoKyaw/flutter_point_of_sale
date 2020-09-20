import 'package:flutter/material.dart';
import 'package:ymk_pos/components/button/mainbutton.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(10),
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
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 12,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconSize: 0.0,
                              isExpanded: true,
                              items: getDropDownItems(
                                  ['Box', 'Single', 'components']),
                              value: 'Box',
                              onChanged: (value) {},
                              // decoration: InputDecoration.collapsed(hintText: ''),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              child: Icon(
                                Icons.remove,
                                color: Colors.red,
                                size: 16,
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '10',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                                size: 16,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                        Text(
                          '100',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 140,
              color: Colors.green.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Sub Total'),
                      ),
                      Text('20000 Ks')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Discount'),
                      ),
                      Text('2000 Ks')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Total'),
                      ),
                      Text('18000 Ks')
                    ],
                  ),
                  MainButton(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    title: 'Charge',
                    onPress: () {},
                  )
                ],
              ),
            ),
          ],
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
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      );
    }
    return ditems;
  }
}
