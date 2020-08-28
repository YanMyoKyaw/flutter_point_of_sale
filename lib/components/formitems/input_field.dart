import 'package:flutter/material.dart';

class InputField extends StatelessWidget{
  InputField({@required this.title, @required this.controller, this.isRequired = false, this.errorMessage, this.inputType = TextInputType.text});
  final String title;
  final TextEditingController controller;
  final bool isRequired;
  final String errorMessage;
  final TextInputType inputType;
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
          keyboardType: inputType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12),
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (isRequired && value.isEmpty) {
              return errorMessage.isNotEmpty? errorMessage : 'This field required!';
            }
            return null;
          },
        ),
      ],
    );
  }
}