import '../request/request.dart';
import '../models/brand.dart';

class BrandService {
  var client = RestClient.create();

  Future<List<Brand>> getBrandList(int limit, int offset, String search) async {
    String query = "name__icontains:$search";
    List<Brand> brandList =
        await client.getBrand("UpdatedAt", "desc", limit, offset, query);
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
