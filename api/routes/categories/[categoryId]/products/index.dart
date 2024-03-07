import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:product_repository/product_repository.dart';

FutureOr<Response> onRequest(
  RequestContext context,
  String categoryId,
) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, categoryId);
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, String categoryId) async {
  final productRepository = context.read<ProductRepository>();
  final products = await productRepository.getProductsByCategoryId(categoryId);
  return Response.json(body: products);
}
