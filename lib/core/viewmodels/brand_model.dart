import 'package:ymk_pos/core/enums/viewstate.dart';
import 'package:ymk_pos/core/models/brand.dart';
import 'package:ymk_pos/core/services/brand_service.dart';
import 'base_model.dart';
import 'package:ymk_pos/locator.dart';

class BrandModel extends BaseModel {
  BrandService _brandService = locator<BrandService>();
  String _errorCode;
  String _errorMessage;
  List<Brand> _brandList;
  Brand _brand;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  List<Brand> get brandList => _brandList;
  Brand get brand => _brand;

  // BrandModel();

  // BrandModel.instance() {
  //   getBrandList();
  // }

  Future getBrandList() async {
    setState(ViewState.Loading);
    _brandList = await _brandService.getBrandList();
    setState(ViewState.Ended);
  }

  Future createBrand(Brand brand) async {
    setState(ViewState.Loading);

    _brand = await _brandService.createBrand(brand);

    setState(ViewState.Ended);
  }

  Future<String> updateBrand(Brand brand) async {
    String result = await _brandService.updateBrand(brand);
    return result;
  }
}
