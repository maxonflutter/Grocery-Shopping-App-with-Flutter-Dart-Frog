import 'dart:async';
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

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
  // Get the cart and its items
  return Response.json(body: []);
}

Future<Response> _post(RequestContext context, String userId) async {
  // Add one product to the cart
  throw UnimplementedError();
}
