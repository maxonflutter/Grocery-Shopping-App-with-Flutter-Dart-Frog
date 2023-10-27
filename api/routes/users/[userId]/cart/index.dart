import 'dart:async';
import 'dart:io';
import 'package:cart_repository/cart_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:models/models.dart';

FutureOr<Response> onRequest(RequestContext context, String userId) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, userId);
    case HttpMethod.post:
      return _post(context, userId);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, String userId) async {
  final cartRepository = context.read<CartRepository>();
  final cartItems = await cartRepository.getCartItems(userId);
  return Response.json(body: cartItems);
}

Future<Response> _post(RequestContext context, String userId) async {
  final body = await context.request.json() as Map<String, dynamic>;

  try {
    final product = Product.fromJson(body);
    final cartRepository = context.read<CartRepository>();
    final cartItem = await cartRepository.addToCart(userId, product);
    return Response.json(body: cartItem.toJson());
  } catch (err) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Invalid cart item',
    );
  }
}


// Resource Ownership:
// If the cart is a resource that is "owned" by a user, then the nested resource approach
// (users/[user_id]/cart) can make more sense because it clearly indicates that the cart
// belongs to a specific user. This approach can be more scalable if in the future you
// want to add more resources that belong to a user, e.g., users/[user_id]/orders,
// users/[user_id]/wishlist, etc.

// Simplicity: If you're only concerned about the cart and not modeling other aspects of a user,
// cart/[user_id] is simpler and to the point.

// RESTful Principles: In a RESTful design, URLs often represent resources, and the
// hierarchy/nesting represents relationships or ownership. So, users/[user_id]/cart is a
// typical RESTful design showing the relationship between the user and their cart.
