import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'cart_item.dart';
import 'product.dart';

class Cart extends Equatable {
  final String userId;
  final List<CartItem> cartItems;

  Cart({
    required this.userId,
    required this.cartItems,
  });

  Cart copyWith({
    String? userId,
    List<CartItem>? cartItems,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  int get totalQuantity =>
      cartItems.fold(0, (total, item) => total + item.quantity);

  double get totalPrice =>
      cartItems.fold(0, (total, item) => total + item.subtotal);

  @override
  List<Object> get props => [userId, cartItems];

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        userId: json['userId'] ?? '',
        cartItems: (json['cartItems'] as List)
            .map((i) => CartItem.fromJson(i))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'cartItems': cartItems.map((item) => item.toJson()).toList(),
      };

  static List<Cart> sampleData = [
    Cart(
      userId: Uuid().v4(),
      cartItems: [
        CartItem(
          id: Uuid().v4(),
          product: Product(
            id: Uuid().v4(),
            description: 'A delicious apple.',
            name: 'Apple',
            price: 1.99,
            categoryId: '1',
            imageUrl: 'https://source.unsplash.com/random/?apple',
          ),
          quantity: 5,
          subtotal: 9.95,
        ),
        CartItem(
          id: Uuid().v4(),
          product: Product(
            id: Uuid().v4(),
            description: 'A delicious orange.',
            name: 'Orange',
            price: 0.99,
            categoryId: '1',
            imageUrl: 'https://source.unsplash.com/random/?orange',
          ),
          quantity: 3,
          subtotal: 2.97,
        ),
      ],
    ),
    Cart(
      userId: Uuid().v4(),
      cartItems: [
        CartItem(
          id: Uuid().v4(),
          product: Product(
            id: Uuid().v4(),
            name: 'Banana',
            description: 'A delicious banana.',
            price: 0.69,
            categoryId: '1',
            imageUrl: 'https://source.unsplash.com/random/?banana',
          ),
          quantity: 10,
          subtotal: 6.9,
        ),
      ],
    ),
  ];
}
