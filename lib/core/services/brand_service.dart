import '../request/request.dart';
import '../models/brand.dart';

class BrandService {
  var client = RestClient.create();

  Future<List<Brand>> getBrandList() async {
    List<Brand> brandList = await client.getBrand("UpdatedAt", "desc", -1, 0);
    return brandList;
  }

  Future<Brand> createBrand(Brand brand) async {
    Brand _brand = await client.createBrand(brand);
    return _brand;
  }

  Future<String> updateBrand(Brand brand) async {
    String result = await client.updateBrand(brand.id, brand);
    return result;
  }
}
