part of 'shopping_cart_bloc.dart';

import 'package:equatable/equatable.dart';

abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();

  @override
  List<Object> get props => [];
}

class ShoppingCartAddProductEvent extends ShoppingCartEvent {
  const ShoppingCartAddProductEvent(this.product);

  final Product product;

  @override
  List<Object> get props => [product];
}

class ShoppingCartRemoveProductEvent extends ShoppingCartEvent {
  const ShoppingCartRemoveProductEvent(this.productId);

  final String productId;

  @override
  List<Object> get props => [productId];
}

class ShoppingCartClearEvent extends ShoppingCartEvent {
  const ShoppingCartClearEvent();
} 