import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:trials/core/shared_pref.dart';

class Api {
  final Dio _dio;

  Api() : _dio = Dio();

  Future<dynamic> get(
      {required String url,
      Map<String, dynamic>? queryParams,
      required formData}) async {
    final token = await getString('token');
    if (token != null) {
      _dio.options.headers['Authorization'] = token;
      debugPrint(token);
    }

    final response = await _dio.get(url, queryParameters: formData);
    return response.data;
  }

  Future<dynamic> post({required String url, FormData? formData}) async {
    final token = await getString('token');
    if (token != null) {
      _dio.options.headers['Authorization'] = token;
      _dio.options.headers['Content-Type'] = 'multipart/form-data';
      debugPrint(token);
    }
    final response = await _dio.post(url, data: formData);
    return response.data;
  }
}
