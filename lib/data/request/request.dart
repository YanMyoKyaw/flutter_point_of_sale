import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/brand.dart';
import '../models/shop.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'request.g.dart';

@RestApi(baseUrl: 'http://128.199.167.17:8989/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient create() {
    final dio = addInterceptors(Dio());
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        responseBody: true));
    return RestClient(dio);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options) => requestInterceptor(options),
          onResponse: (Response response) => responseInterceptor(response),
          onError: (DioError dioError) => errorInterceptor(dioError)));
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // options.headers.addAll({"authorization": "Bearer " + info.token,"applicationid": "d8137f82-d5af-43a8-aecc-818c10667b1c"});
    options.headers["Content-Type"] = "application/json";
    return options;
  }

  static dynamic responseInterceptor(Response options) async {
    if (options.data == null) {
      options.data = [];
    }
    return options;
  }

  static dynamic errorInterceptor(DioError dioError) {
    return dioError;
  }

  @GET("/brand")
  Future<List<Brand>> getBrand();

  @GET("/shop")
  Future<List<Shop>> getShop();
}
