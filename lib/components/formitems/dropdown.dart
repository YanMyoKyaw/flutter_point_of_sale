import 'package:flutter/material.dart';

typedef OnChange(String value);

class DropDown extends StatefulWidget{
  DropDown({@required this.title, @required this.items, @required this.selected, this.onChange});
  final String title;
  final OnChange onChange;
  final List<String> items;
  final String selected;
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown>{
  List<DropdownMenuItem<String>> _dropDownItems;

  @override
  void initState() {
    super.initState();
    _dropDownItems = getDropDownItems();
  }

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in widget.items) {
      items.add(new DropdownMenuItem(value: item, child: new Text(item)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            items: _dropDownItems,
            value: widget.selected,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(12),
            ),
          ),
        ),
      ],
    );
  }
}