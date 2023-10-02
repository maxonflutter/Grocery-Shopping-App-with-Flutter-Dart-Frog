import 'package:models/models.dart';

import '../services/api_client.dart';

class ProductRepository {
  final ApiClient apiClient;

  const ProductRepository({required this.apiClient});

  Future<List<Product>> getProducts() async {
    final response = await apiClient.getProducts();

    if (response['products'] != null) {
      return response['products']
          .map<Product>((json) => Product.fromJson(json))
          .toList();
    } else {
      return [];
    }
  }
}
