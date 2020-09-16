import 'package:flutter/material.dart';
import 'package:ymk_pos/components/formitems/formitems.dart';
import 'package:ymk_pos/components/button/mainbutton.dart';

class BrandNew extends StatelessWidget {
  static String tag = 'brand-new';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Brand"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      InputField(
                        title: 'Name',
                        controller: _name,
                        errorMessage: 'Please Enter Brand Name',
                        isRequired: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InputField(
                        title: 'Description',
                        controller: _description,
                      )
                    ],
                  ),
                ),
              ),
              MainButton(
                width: MediaQuery.of(context).size.width,
                title: "Submit",
                onPress: () {
                  _formKey.currentState.validate();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
