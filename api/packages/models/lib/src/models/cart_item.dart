import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
import 'package:uuid/uuid.dart';

class CartItem extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final double subtotal;

  const CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.subtotal,
  });

  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    double? subtotal,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  List<Object> get props => [id, product, quantity, subtotal];

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? const Uuid().v4(),
      product: Product.fromJson(json['product']),
      quantity: json['quantity'] ?? 0,
      subtotal: json['subtotal'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
      'subtotal': subtotal,
    };
  }

  static List<CartItem> sampleData = [
    CartItem(
      id: const Uuid().v4(),
      product: Product.empty,
      quantity: 2,
      subtotal: 59.98,
    ),
    CartItem(
      id: const Uuid().v4(),
      product: Product.empty,
      quantity: 1,
      subtotal: 29.99,
    ),
  ];
}
