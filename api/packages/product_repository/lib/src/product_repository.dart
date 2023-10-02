import 'package:models/models.dart';

class ProductRepository {
  Future<Product> getProductById(String productId) async {
    return Product.sampleData.firstWhere(
      (product) => product.id == productId,
    );
  }

  Future<List<Product>> getProductsByCategoryId(String categoryId) async {
    return Product.sampleData
        .where((product) => product.categoryId == categoryId)
        .toList();
  }

  Future<List<Product>> getProducts() async {
    return Product.sampleData;
  }

  Future<List<Product>> getPopularProducts() async {
    return Product.sampleData.where((product) => product.isPopular).toList();
  }

  Future<List<Product>> getTrendingProducts() async {
    return Product.sampleData.where((product) => product.isTrending).toList();
  }
}
