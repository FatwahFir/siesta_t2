import 'package:dio/dio.dart';

import '../models/product.dart';

class ApiService {
  static const String baseUrl = 'https://api.escuelajs.co/api/v1';

  static final Dio _dio = Dio();

  static Future<List<Product>> fetchProducts(
      {required int offset, int limit = 10}) async {
    try {
      final response = await _dio.get(
        '$baseUrl/products',
        queryParameters: {
          'offset': offset,
          'limit': limit,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to fetch products with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
