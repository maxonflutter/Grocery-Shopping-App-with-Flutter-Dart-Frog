import 'package:cart_repository/cart_repository.dart';
import 'package:dart_frog/dart_frog.dart';

final _cartRepository = CartRepository();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<CartRepository>((_) => _cartRepository));
}
