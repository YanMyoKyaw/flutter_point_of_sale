import 'package:flutter/material.dart';

class MultiInput extends StatelessWidget{
  MultiInput({@required this.title, @required this.controller, this.maxLines = 10, this.isRequired = false, this.errorMessage});
  final String title;
  final TextEditingController controller;
  final int maxLines;
  final bool isRequired;
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if(isRequired && value.isEmpty){
              return errorMessage;
            }
            return null;
          },
        ),
      ],
    );
  }
}