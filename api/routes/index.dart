import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response(body: 'Welcome to Dart Frog!');
}

// API Endpoints
// categories/ 
// categories/:categoryId
// categories/:categoryId/products
// products/ 
// products/id/:productId
// products/trending
// products/popular
// users/:userId/cart/
// users/:userId/cart/:itemId
