import 'dart:async';
import 'dart:io';

import 'package:category_repository/category_repository.dart';
import 'package:dart_frog/dart_frog.dart';

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
  final categoryRepository = context.read<CategoryRepository>();
  final category = await categoryRepository.getCategoryById(categoryId);
  return Response.json(body: category);
}
