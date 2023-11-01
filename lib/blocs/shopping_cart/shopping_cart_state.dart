part of 'shopping_cart_bloc.dart';

enum ShoppingCartStatus { initial, loading, loaded, error }

class ShoppingCartState extends Equatable {
  final ShoppingCartStatus status;
  final List<Product> cartItems;

  const ShoppingCartState({
    this.status = ShoppingCartStatus.initial,
    required this.cartItems,
  });

  ShoppingCartState copyWith({
    ShoppingCartStatus? status,
    List<Product>? cartItems,
  }) {
    return ShoppingCartState(
      status: status ?? this.status,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  @override
  List<Object?> get props => [status, cartItems];
}