import 'package:dart_frog/dart_frog.dart';
import 'package:product_repository/product_repository.dart';

final _productRepository = ProductRepository();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<ProductRepository>((_) => _productRepository));
}
