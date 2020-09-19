import 'package:flutter/material.dart';

enum SalePageModelStatus {
  Ended,
  Loading,
  Error,
}

class SalePageModel extends ChangeNotifier {
  SalePageModelStatus _status;
  String _errorCode;
  String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  SalePageModelStatus get status => _status;

  SalePageModel();

  SalePageModel.instance() {
    //TODO Add code here
  }
  
  void getter() {
    _status = SalePageModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = SalePageModelStatus.Ended;
    notifyListeners();
  }

  void setter() {
    _status = SalePageModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = SalePageModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = SalePageModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = SalePageModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = SalePageModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = SalePageModelStatus.Ended;
    notifyListeners();
  }
}