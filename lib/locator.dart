import 'package:get_it/get_it.dart';
import 'core/viewmodels/brand_model.dart';
import 'core/services/brand_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  // locator.registerLazySingleton(() => RestClient.create());
  locator.registerFactory<BrandModel>(() => BrandModel());
  locator.registerFactory<BrandService>(() => BrandService());
}
