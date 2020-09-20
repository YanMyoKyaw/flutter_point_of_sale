// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://192.168.42.41:8080/v1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getBrand(sortBy, order, limit, offset) async {
    ArgumentError.checkNotNull(sortBy, 'sortBy');
    ArgumentError.checkNotNull(order, 'order');
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(offset, 'offset');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sortby': sortBy,
      r'order': order,
      r'limit': limit,
      r'offset': offset
    };
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/brand',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Brand.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  createBrand(brand) async {
    ArgumentError.checkNotNull(brand, 'brand');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(brand?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request('/brand',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Brand.fromJson(_result.data);
    return value;
  }

  @override
  updateBrand(id, brand) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(brand, 'brand');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(brand?.toJson() ?? <String, dynamic>{});
    final Response<String> _result = await _dio.request('/brand/{id}',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  getShop() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/shop',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Shop.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
