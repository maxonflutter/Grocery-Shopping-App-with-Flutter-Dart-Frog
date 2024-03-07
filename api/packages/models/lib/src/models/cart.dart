import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'cart_item.dart';

enum CartSubstitutionPreference {
  noSubstitutions(
    name: 'Don’t substitute anything',
    description:
        'Items will not be substituted if unavailable and you will be refunded',
  ),
  allowSubstitutions(
    name: 'Substitute if unavailable',
    description:
        'If items in your cart somehow become out of stock, we’ll contact you to find a substitution',
  );

  const CartSubstitutionPreference({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;
}

class Cart extends Equatable {
  final String userId;
  final List<CartItem> cartItems;
  final CartSubstitutionPreference? substitutionPreference;

  const Cart({
    required this.userId,
    required this.cartItems,
    this.substitutionPreference = CartSubstitutionPreference.noSubstitutions,
  });

  Cart copyWith({
    String? userId,
    List<CartItem>? cartItems,
    CartSubstitutionPreference? substitutionPreference,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      cartItems: cartItems ?? this.cartItems,
      substitutionPreference:
          substitutionPreference ?? this.substitutionPreference,
    );
  }

  int get totalQuantity {
    return cartItems.fold(0, (total, item) => total + item.quantity);
  }

  double get totalPrice {
    return cartItems.fold(
        0, (total, item) => total + item.product.price * item.quantity);
  }

  @override
  List<Object?> get props => [userId, cartItems, substitutionPreference];

  factory Cart.fromJson(
    Map<String, dynamic> json,
    String userId,
  ) {
    return Cart(
      userId: userId,
      cartItems:
          (json['CartItems'] as List).map((i) => CartItem.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'CartItems': cartItems.map((cartItem) => cartItem.toJson()).toList(),
      };

  static List<Cart> sampleData = [
    Cart(
      userId: const Uuid().v4(),
      cartItems: CartItem.sampleData,
    ),
    Cart(
      userId: const Uuid().v4(),
      cartItems: CartItem.sampleData,
    ),
  ];
}
