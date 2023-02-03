// import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
import 'package:news_clean_arch_app/core/services_locator.dart';

abstract class ApiService {
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams);
}

class ApiServiceImpl implements ApiService {
  final Dio _dio = sl<Dio>();

  @override
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams) async {
    // final http.Response response = await http.get(
    //   Uri.parse(url).replace(queryParameters: queryParams),
    // );

    final Response response = await _dio.get(url, queryParameters: queryParams);

    if (response.statusCode == 200) {
      // return json.decode(response.body) as Map<String, dynamic>; //Http package

      return response.data as Map<String, dynamic>; // Dio package
    } else {
      throw Exception("Status code: ${response.statusCode.toString()}");
    }
  }
}
