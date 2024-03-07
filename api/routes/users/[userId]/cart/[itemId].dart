import 'dart:async';
import 'dart:io';
import 'package:cart_repository/cart_repository.dart';
import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(
  RequestContext context,
  String userId,
  String itemId,
) async {
  switch (context.request.method) {
    case HttpMethod.delete:
      return _delete(context, userId, itemId);
    case HttpMethod.post:
    case HttpMethod.get:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _delete(
  RequestContext context,
  String userId,
  String itemId,
) async {
  final cartRepository = context.read<CartRepository>();
  await cartRepository.removeFromCart(userId, itemId);
  return Response.json(body: 'The item has been removed from the cart.');
}
