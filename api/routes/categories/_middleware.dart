import 'package:category_repository/category_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:product_repository/product_repository.dart';

final _categoryRepository = CategoryRepository();
final _productRepository = ProductRepository();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<CategoryRepository>((_) => _categoryRepository))
      .use(provider<ProductRepository>((_) => _productRepository));
}
