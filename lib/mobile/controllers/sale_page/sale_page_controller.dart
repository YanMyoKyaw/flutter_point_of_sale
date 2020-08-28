import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:ymk_pos/mobile/models/sale_page/sale_page_model.dart';

class SalePageController {
  SalePageController();
  
  void getter(BuildContext context) {
    SalePageModel viewModel = Provider.of<SalePageModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    SalePageModel viewModel = Provider.of<SalePageModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    SalePageModel viewModel = Provider.of<SalePageModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    SalePageModel viewModel = Provider.of<SalePageModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }
}