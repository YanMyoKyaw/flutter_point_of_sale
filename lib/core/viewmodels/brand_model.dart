import 'package:ymk_pos/core/enums/viewstate.dart';
import 'package:ymk_pos/core/models/brand.dart';
import 'package:ymk_pos/core/services/brand_service.dart';
import 'base_model.dart';
import 'package:ymk_pos/locator.dart';

class BrandModel extends BaseModel {
  BrandService _brandService = locator<BrandService>();
  String _errorCode;
  String _errorMessage;
  List<Brand> _brandList = new List<Brand>();
  Brand _brand;
  int limit = 10;
  int offset = 0;
  bool done = false;
  String search = '';

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  List<Brand> get brandList => _brandList;
  Brand get brand => _brand;

  Future getBrandList() async {
    setState(ViewState.Loading);
    try {
      var brands = await _brandService.getBrandList(limit, offset, search);
      if (brands != null) {
        _brandList = List.from(_brandList)..addAll(brands);
        offset = offset + limit;
        if (brands.length < limit) {
          done = true;
        }
      } else {
        done = true;
      }
    } catch (e) {
      offset = offset - limit;
      setState(ViewState.Error);
    }
    setState(ViewState.Ended);
  }

  Future<Brand> createBrand(Brand brand) async {
    _brand = await _brandService.createBrand(brand);
    return brand;
  }

  Future<String> updateBrand(Brand brand) async {
    String result = await _brandService.updateBrand(brand);
    return result;
  }
}
