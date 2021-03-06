import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ymk_pos/components/formitems/formitems.dart';
import 'package:ymk_pos/components/button/mainbutton.dart';
import 'package:ymk_pos/config/config.dart';
import 'package:ymk_pos/components/img/imagetype.dart';
import 'package:ymk_pos/core/models/brand.dart';
import 'package:ymk_pos/core/models/shop.dart';
import 'package:ymk_pos/core/viewmodels/brand_model.dart';
import '../base_view.dart';
import 'dart:io';

class BrandNew extends StatefulWidget {
  @override
  _BrandNewState createState() => _BrandNewState();
}

class _BrandNewState extends State<BrandNew> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();
  AppUtil appUtil = AppUtil();
  File coverPhoto;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BaseView<BrandModel>(
      builder: (context, brandModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Create Brand"),
          ),
          resizeToAvoidBottomInset: false,
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
                          InkWell(
                            child: Container(
                              width: width,
                              height: 200,
                              margin: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(color: Colors.black26),
                              child: coverPhoto == null
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "ADD BRAND PHOTO",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(
                                      padding: EdgeInsets.all(5),
                                      child: Image(
                                        image: FileImage(coverPhoto),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                            ),
                            onTap: () async {
                              final croppedFile = await pickAndCropImg();
                              setState(() {
                                coverPhoto = croppedFile;
                              });
                            },
                          ),
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
                    width: width,
                    title: "Submit",
                    onPress: () async {
                      if (_formKey.currentState.validate()) {
                        String byteStr = coverPhoto != null
                            ? await AppUtil().getBase64(coverPhoto)
                            : '';
                        String name = _name.text.toString();
                        String description = _description.text.toString();
                        Brand brand = Brand(
                            name: name,
                            description: description,
                            shopId: Shop(id: 1),
                            imgUrl: byteStr);
                        var bdr = await brandModel.createBrand(brand);
                        if (bdr != null) {
                          Fluttertoast.showToast(
                              msg: "Successfully Create",
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              gravity: ToastGravity.BOTTOM);
                          Navigator.pop(context);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Fail to Create",
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              gravity: ToastGravity.BOTTOM);
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
