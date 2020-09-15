// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://128.199.167.17:8989/v1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getBrand() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
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
}
