import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({
    http.Client? httpClient,
  }) : this._(
          baseUrl: 'http://localhost:8080',
          httpClient: httpClient,
        );

  ApiClient._({
    required String baseUrl,
    http.Client? httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient ?? http.Client();

  final String _baseUrl;
  final http.Client _httpClient;

  /// GET /categories
  Future<Map<String, dynamic>> getCategories() {
    final uri = Uri.parse('$_baseUrl/categories');
    return _handleRequest(
      (headers) => _httpClient.get(uri, headers: headers),
    );
  }

  /// GET /categories/{categoryId}
  Future<Map<String, dynamic>> getCategory(String categoryId) {
    final uri = Uri.parse('$_baseUrl/categories/$categoryId');
    return _handleRequest(
      (headers) => _httpClient.get(uri, headers: headers),
    );
  }

  /// GET /products
  Future<Map<String, dynamic>> getProducts({
    String? category,
    String? price,
    String? brand,
  }) {
    final uri = Uri.parse('$_baseUrl/products').replace(
      queryParameters: <String, String>{
        if (category != null) 'category': category,
        if (price != null) 'price': price,
        if (brand != null) 'brand': brand,
      },
    );

    return _handleRequest(
      (headers) => _httpClient.get(uri, headers: headers),
    );
  }

  /// GET /products/{productId}
  Future<Map<String, dynamic>> getProduct(String productId) {
    final uri = Uri.parse('$_baseUrl/products/$productId');
    return _handleRequest(
      (headers) => _httpClient.get(uri, headers: headers),
    );
  }

  /// POST /cart
  Future<Map<String, dynamic>> addToCart({
    required String productId,
    required int quantity,
  }) {
    final uri = Uri.parse('$_baseUrl/cart');
    return _handleRequest(
      (headers) => _httpClient.post(
        uri,
        headers: headers,
        body: jsonEncode({
          'productId': productId,
          'quantity': quantity,
        }),
      ),
    );
  }

  /// PUT /cart/{itemId}
  Future<Map<String, dynamic>> updateCartItem({
    required String itemId,
    required int quantity,
  }) {
    final uri = Uri.parse('$_baseUrl/cart/$itemId');
    return _handleRequest(
      (headers) => _httpClient.put(
        uri,
        headers: headers,
        body: jsonEncode({
          'quantity': quantity,
        }),
      ),
    );
  }

  /// GET /cart
  Future<Map<String, dynamic>> getCartItems() {
    final uri = Uri.parse('$_baseUrl/cart');
    return _handleRequest(
      (headers) => _httpClient.get(uri, headers: headers),
    );
  }

  /// DELETE /cart/{itemId}
  Future<void> removeCartItem({
    required String itemId,
  }) {
    final uri = Uri.parse('$_baseUrl/cart/$itemId');
    return _handleRequest(
      (headers) => _httpClient.delete(uri, headers: headers),
    );
  }

  Future<Map<String, dynamic>> _handleRequest(
    Future<http.Response> Function(Map<String, String>) request,
  ) async {
    try {
      final headers = await _getRequestHeaders();
      final response = await request(headers);
      final body = jsonDecode(response.body);

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('${response.statusCode}, error: ${body['message']}');
      }

      return body;
    } on TimeoutException {
      throw Exception('Request timeout. Please try again');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Map<String, String>> _getRequestHeaders() async {
    // TODO: Get token from secure storage;
    return <String, String>{
      HttpHeaders.contentTypeHeader: ContentType.json.value,
      HttpHeaders.acceptHeader: ContentType.json.value,
      // If there is a token, add it to the headers
      // if (token != null) HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }
}
