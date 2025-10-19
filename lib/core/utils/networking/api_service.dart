import 'package:dio/dio.dart';

import 'api_constants.dart';

class DioHelper {
  Dio dio = Dio(BaseOptions(headers: {"Accept": "application/json"}));

  // +++++++++++++++++ Get Data Method +++++++++++++++++
  Future<Response> getData({
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    required String endpoint,
  }) async {
    dio.options.headers = headers ?? ApiConstants.headers;
    return await dio.get(
      "${ApiConstants.baseUrl}$endpoint",
      queryParameters: query,
    );
  }
}
