part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {
  final String userId;

  const LoadCart(this.userId);

  @override
  List<Object> get props => [userId];
}

class AddToCart extends CartEvent {
  final String userId;
  final Product product;

  const AddToCart({
    required this.userId,
    required this.product,
  });

  @override
  List<Object> get props => [product, userId];
}

class RemoveFromCart extends CartEvent {
  final String userId;
  final CartItem cartItem;

  const RemoveFromCart({
    required this.userId,
    required this.cartItem,
  });

  @override
  List<Object> get props => [cartItem, userId];
}
