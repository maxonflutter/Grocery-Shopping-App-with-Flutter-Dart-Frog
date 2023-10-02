import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:product_repository/product_repository.dart';

FutureOr<Response> onRequest(RequestContext context, String productId) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, productId);
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, String productId) async {
  final productRepository = context.read<ProductRepository>();
  final product = await productRepository.getProductById(productId);
  return Response.json(body: product);
}
