import 'package:equatable/equatable.dart';
import 'package:models/src/models/address.dart';
import 'package:uuid/uuid.dart';

import 'product.dart';

class Order extends Equatable {
  final String id;
  final String userId;
  final List<Product> products;
  final double totalAmount;
  final DateTime orderDate;
  final String status;
  final Address deliveryAddress;

  const Order({
    required this.id,
    required this.userId,
    required this.products,
    required this.totalAmount,
    required this.orderDate,
    required this.status,
    required this.deliveryAddress,
  });

  Order copyWith({
    String? id,
    String? userId,
    List<Product>? products,
    double? totalAmount,
    DateTime? orderDate,
    String? status,
    Address? deliveryAddress,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      products: products ?? this.products,
      totalAmount: totalAmount ?? this.totalAmount,
      orderDate: orderDate ?? this.orderDate,
      status: status ?? this.status,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      products: (json['products'] as List).map((i) {
        return Product.fromJson(i);
      }).toList(),
      totalAmount: json['totalAmount'] ?? 0.0,
      orderDate: DateTime.parse(json['orderDate'] ?? ''),
      status: json['status'] ?? '',
      deliveryAddress: json['deliveryAddress'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'products': products,
      'totalAmount': totalAmount,
      'orderDate': orderDate.toIso8601String(),
      'status': status,
      'deliveryAddress': deliveryAddress,
    };
  }

  static List<Order> sampleData = [
    Order(
      id: const Uuid().v4(),
      userId: const Uuid().v4(),
      products: Product.sampleData,
      totalAmount: 25.0,
      orderDate: DateTime.now(),
      status: 'processing',
      deliveryAddress: Address.sampleData[0],
    ),
    Order(
      id: const Uuid().v4(),
      userId: const Uuid().v4(),
      products: Product.sampleData,
      totalAmount: 70.0,
      orderDate: DateTime.now(),
      status: 'shipped',
      deliveryAddress: Address.sampleData[0],
    ),
  ];

  @override
  List<Object> get props => [
        id,
        userId,
        products,
        totalAmount,
        orderDate,
        status,
        deliveryAddress,
      ];
}
