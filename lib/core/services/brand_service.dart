import '../request/request.dart';
import '../models/brand.dart';

class BrandService {
  var client = RestClient.create();

  Future<List<Brand>> getBrandList() async {
    List<Brand> brandList = await client.getBrand();
    return brandList;
  }

  Future<Brand> createBrand(Brand brand) async {
    Brand _brand = await client.createBrand(brand);
    return _brand;
  }
}